import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndp_sushi_restaurant/Authentication/login.dart';
import 'package:ndp_sushi_restaurant/components/button.dart';
import 'package:ndp_sushi_restaurant/global/global.dart';
import 'package:ndp_sushi_restaurant/pages/menu_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    // checkUser() {
    //   Future.delayed(Duration(seconds: 100), () {
    //     if (firebaseAuth.currentUser != null) {
    //       Navigator.push(context, MaterialPageRoute(builder: (c) => MenuPage()));
    //     } else {
    //       Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
    //     }
    //   });
    // }


    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(

        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          const SizedBox(
            height: 25,
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              "SUSHI MAN",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          const Center(
            child: Image(
              image: AssetImage('images/sushi.png'),
              width: 175,
              height: 175,
              fit: BoxFit.contain,
            ),
            // padding: const EdgeInsets.all(1.0),
            // child: Image.asset('lib/images/sushi (1).png'),
          ),

          const SizedBox(height: 25,),

          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "THE TASTE OF JAPANESE FOOD",
              textAlign: TextAlign.center,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 40,
                color: Colors.white,
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Container(
            margin: EdgeInsets.only(left: 5),
            child: const Text("Feel the taste of the most popular Japanese food from anywhere and anytime.",
              style: TextStyle(
                color: Colors.grey,
                height: 2,
              ),
            ),
          ),

          const SizedBox(height: 25,),

          Container(
            margin: const EdgeInsets.only(left: 9, right: 9),
            child: MyButton(
                text: "Get Started",
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (c) => const MenuPage()));
                  if (firebaseAuth.currentUser != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => MenuPage()));
                  } else {
                    Navigator.push(context, MaterialPageRoute(builder: (c) => LoginScreen()));
                  }
                },
            ),
          )
        ]
      ),
    );
  }
}
