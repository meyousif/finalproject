import 'package:flutter/material.dart';

class Whyslurp extends StatefulWidget {
  const Whyslurp({super.key});

  @override
  State<Whyslurp> createState() => _WhyslurpState();
}

class _WhyslurpState extends State<Whyslurp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Text("Why SLURP?",textAlign: TextAlign.right,style: TextStyle(fontFamily: "Poppins",color: Colors.white),),
             Text("SLURP is first and only coffee Membership",style: TextStyle(fontSize: 13,color: Colors.white),)
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
                  padding: const EdgeInsets.only(top: 80,left: 5),
                  child: Image.asset("assets/Icon1.png",fit: BoxFit.cover,),
                )
              ),
              const SizedBox(height: 50,),
              const Padding(
                padding: EdgeInsets.only(left: 35,right: 35),
                child: Text("Coffee is a cherished beverage enjoyed by millions worldwide, and its importance goes beyond just being a morning ritual. It serves as a vital source of energy, providing a much-needed boost to start the day.",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins",fontSize: 20,fontWeight: FontWeight.w600),)),
              const SizedBox(height: 40),  
              const Padding(
                padding: EdgeInsets.only(left: 35,right: 35),
                child: Text("The caffeine in coffee stimulates the central nervous system, enhancing alertness, concentration, and overall cognitive function.",textAlign: TextAlign.left,style: TextStyle(fontFamily: "Poppins",fontSize: 20,fontWeight: FontWeight.w600),)),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}