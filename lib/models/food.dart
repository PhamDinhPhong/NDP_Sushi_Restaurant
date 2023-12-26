import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String foodName;
  String foodPrice;
  String foodImagePath;
  String foodRating;
  String foodDescription;


  Food({
    required this.foodName,
    required this.foodPrice,
    required this.foodImagePath,
    required this.foodRating,
    required this.foodDescription,

  });

  // String get _name => foodName;
  // String get _price => foodPrice;
  // String get _imagePath => foodImagePath;
  // String get _rating => foodRating;
  // String get _description => foodDescription;

  toJson() {
    return {
      foodName: "foodName",
      foodPrice: "foodPrice",
      foodImagePath: "foodImagePath",
      foodRating: "foodRating",
      foodDescription: "foodDescription",
    };
  }

  factory Food.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Food(
        foodName: data["foodName"],
        foodPrice: data["foodPrice"],
        foodImagePath: data["foodImagePath"],
        foodRating: data["foodRating"],
        foodDescription: data["foodDescription"]
    );
  }

}
