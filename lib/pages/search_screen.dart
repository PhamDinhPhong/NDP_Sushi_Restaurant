// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:ndp_sushi_restaurant/models/food.dart';
// import 'package:ndp_sushi_restaurant/pages/food_details_page.dart';
//
// class SearchScreen extends StatefulWidget {
//   BuildContext? context;
//
//   SearchScreen({
//     super.key,
//     required this.context
//   })
//
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
// class _SearchScreenState extends State<SearchScreen> {
//
//   Future<QuerySnapshot>? foodDocumentList;
//   String foodName = "";
//
//   intiSearchFood(String textEntered){
//     foodDocumentList = FirebaseFirestore.instance.collection("food")
//         .where("foodName", isGreaterThanOrEqualTo: textEntered).get();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.brown,
//           iconTheme: IconThemeData(color:  Colors.white),
//           title: TextField(
//             onChanged: (value){
//               setState(() {
//                 foodName = value;
//               });
//               intiSearchFood(value);
//             },
//             decoration: InputDecoration(
//               hintText: "Search Food here...",
//               hintStyle: TextStyle(color: Colors.white54),
//               border: InputBorder.none,
//               suffixIcon: IconButton(
//                 icon: Icon(Icons.search),
//                 color: Colors.white,
//                 onPressed: () {
//                   intiSearchFood(foodName);
//                 },
//               ),
//             ),
//             style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//             ),
//           ),
//         ),
//         body: FutureBuilder(
//           future: foodDocumentList,
//           builder: (context, snapshot) {
//             return !snapshot.hasData
//                 ? ListView.builder(
//                       itemCount: snapshot.data!.docs.length,
//                       itemBuilder: (context, index) {
//                           Food food = Food.fromJson(
//                               snapshot.data!.docs[index].data() as Map<String, dynamic>
//                           );
//
//                           return FoodDetailsPage(
//                               food: food,
//                               context: context,
//                           );
//                       }
//                   ) : Center(child: Text("No record found."),);
//           },
//         ),
//     );
// }
//
//
//
//
