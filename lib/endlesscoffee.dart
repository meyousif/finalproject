import 'package:flutter/material.dart';

class Endlesscoffee extends StatefulWidget {
  const Endlesscoffee({super.key});

  @override
  State<Endlesscoffee> createState() => _EndlesscoffeeState();
}

class _EndlesscoffeeState extends State<Endlesscoffee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Endless Coffee",textAlign: TextAlign.right,style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
             Text("You can get your desired size of coffee",style: TextStyle(fontSize: 13,color: Colors.white),)
             ]),
             backgroundColor: const Color(0xFF1ABB9C),
        leading: 
        InkWell(
          onTap: () {
           Navigator.pop(context); 
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,)),
      ),
      body: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 317,
                width: 317,
                child: Padding(
                  padding: const EdgeInsets.only(top: 110,left: 5),
                  child: Image.asset("assets/Icon2.png",height: 227,width: 227,fit: BoxFit.contain,),
                )
              ),
              const SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.only(left: 35,right: 35),
                child: Text("The caffeine in coffee stimulates the central nervous system, enhancing alertness, concentration, and overall cognitive function. Additionally, coffee has social significance, often serving as a focal point for gatherings and conversations. Its rich aroma and diverse flavors offer a comforting experience, making it a favorite choice for relaxation and enjoyment. Whether for productivity or pleasure, coffee holds a special place in daily life.",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins",fontSize: 20,fontWeight: FontWeight.w600))),
                const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}