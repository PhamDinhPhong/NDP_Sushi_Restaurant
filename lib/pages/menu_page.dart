import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndp_sushi_restaurant/components/button.dart';
import 'package:ndp_sushi_restaurant/components/food_tile.dart';
import 'package:ndp_sushi_restaurant/global/global.dart';
import 'package:ndp_sushi_restaurant/models/food.dart';
import 'package:ndp_sushi_restaurant/pages/food_details_page.dart';
import 'package:ndp_sushi_restaurant/widgets/my_drawer.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/shop.dart';

class MenuPage extends StatefulWidget {

  
  const MenuPage({
    super.key,
  });

  

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  void navigateToFoodDetails(int index) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FoodDetailsPage(
        food: foodMenu[index],
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Food food;
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;

    return Scaffold(
      backgroundColor: Colors.grey[300],
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Food Blood",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Row(
            children: [
              IconButton(onPressed: () {},
                  icon: const Icon(FontAwesomeIcons.shoppingCart)
              ),
            ],

          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 9,),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 9,),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Get 32% Promo",
                      style: GoogleFonts.dmSerifDisplay(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 15),

                    MyButton(text: "Redeem", onTap: () {})
                  ],
                ),

                SizedBox(width: 1,),

                Image.asset(
                  'images/sushi (1).png',
                  height: 90,
                  width: 90,
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Search here.."),
            ),
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              "Food Menu",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
                fontSize: 18,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("food").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (!snapshot.hasData) {
                    List<DocumentSnapshot> docs = (snapshot.data as QuerySnapshot).docs;

                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: foodMenu.length, // Use the length of docs
                      itemBuilder: (context, index) {
                        final foodImagePath = docs[index]["foodImagePath"];
                        final foodName = docs[index]["foodName"];
                        final foodPrice = docs[index]["foodPrice"];
                        final foodRating = docs[index]["foodRating"];

                        return GestureDetector(
                          onTap: () => navigateToFoodDetails(index),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            margin: const EdgeInsets.only(left: 25),
                            padding: const EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                //image
                                Image.network(
                                  "${foodImagePath!}",
                                  height: 140,
                                ),

                                // text
                                Text(
                                  "${foodName!}",
                                  style: GoogleFonts.dmSerifDisplay(fontSize: 20),
                                ),

                                // price + rating
                                SizedBox(
                                  width: 160,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      //price
                                      Text(
                                        '\$' + "${foodPrice!}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold, color: Colors.grey[700]),
                                      ),

                                      // rating
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[800],
                                          ),
                                          Text(
                                            "${foodRating!}",
                                            style: TextStyle(color: Colors.grey),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }
                return const CircularProgressIndicator(); // Add a loading indicator if necessary
              },
            ),
          ),


          const SizedBox(height: 25),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 9, right: 9, bottom: 9),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'images/sushi.png',
                      height: 60,
                    ),

                    const SizedBox(width: 20),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Salmon Eggs",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10),

                        // price
                        Text(
                          '\$20.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                // heart
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 20,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
