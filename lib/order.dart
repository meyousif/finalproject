import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<CoffeeTypes>> fetchCoffees() async {
  final response = await http.get(Uri.parse('https://fake-coffee-api.vercel.app/api'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((item) => CoffeeTypes.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load coffee data ');
  }
}

// ignore: camel_case_types
class order extends StatefulWidget {
  const order({super.key});

  @override
  State<order> createState() => _OrderState();
}

class _OrderState extends State<order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Order",textAlign: TextAlign.right,style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
             Text("You can get your desired size of Coffee",style: TextStyle(fontSize: 13,color: Colors.white),)
             ]),
        backgroundColor: const Color(0xFF1ABB9C),
        leading: 
        InkWell(
          onTap: () {
           Navigator.pop(context); 
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),),
      body: FutureBuilder<List<CoffeeTypes>>(
        future: fetchCoffees(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No coffee data available'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                CoffeeTypes coffee = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F5), // light background color for the tile
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                coffee.name,
                                style: const TextStyle(
                                  fontFamily: 'Food_Delight', // Replace with your font family
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color(0xFF47C1BF), // teal color
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                coffee.description,
                                style: const TextStyle(
                                  fontFamily: 'Poppins', // Replace with your font family
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Text(
                                'Price: \$${coffee.price.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins', // Replace with your font family
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Image.network(
                          coffee.imageUrl,
                          width: 80,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class CoffeeTypes {
  final int id;
  final String name;
  final String description;
  final double price;
  final String region;
  final int weight;
  final List<String> flavorProfile;
  final List<String> grindOption;
  final int roastLevel;
  final String imageUrl;

  CoffeeTypes({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.region,
    required this.weight,
    required this.flavorProfile,
    required this.grindOption,
    required this.roastLevel,
    required this.imageUrl,
  });

  factory CoffeeTypes.fromJson(Map<String, dynamic> json) {
    return CoffeeTypes(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'].toDouble(),
      region: json['region'],
      weight: json['weight'],
      flavorProfile: List<String>.from(json['flavor_profile']),
      grindOption: List<String>.from(json['grind_option']),
      roastLevel: json['roast_level'],
      imageUrl: json['image_url'],
    );
  }
}
