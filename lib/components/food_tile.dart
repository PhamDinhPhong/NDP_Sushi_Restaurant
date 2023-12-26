// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:ndp_sushi_restaurant/models/food.dart';
// import 'package:ndp_sushi_restaurant/models/shop.dart';

// class FoodTile extends StatelessWidget {
//   final Food food;
//   final void Function()? onTap;

//   const FoodTile({
//     super.key,
//     required this.food,
//     required this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.grey[100],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         margin: const EdgeInsets.only(left: 25),
//         padding: const EdgeInsets.all(25),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             //image
//             Image.network(
//               "${snapshot.data!.docs[index]["foodImagePath"]}",
//               height: 140,
//             ),

//             // text
//             Text(
//               "${snapshot.data!.docs[index]["foodName"]}",
//               style: GoogleFonts.dmSerifDisplay(fontSize: 20),
//             ),

//             // price + rating
//             SizedBox(
//               width: 160,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   //price
//                   Text(
//                     '\$' + "${snapshot.data!.docs[index]["foodPrice"]}",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold, color: Colors.grey[700]),
//                   ),

//                   // rating
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.yellow[800],
//                       ),
//                       Text(
//                         "${snapshot.data!.docs[index]["foodRating"]}",
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
