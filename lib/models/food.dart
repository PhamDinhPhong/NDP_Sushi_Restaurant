import 'package:cloud_firestore/cloud_firestore.dart';

class Food {
  String? foodName;
  String? foodPrice;
  String? foodImagePath;
  String? foodRating;
  String? foodDescription;


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
  Food.fromJson(Map<String, dynamic> json) {
    foodName = json["foodName"];
    foodPrice = json["foodPrice"];
    foodImagePath = json["foodImagePath"];
    foodRating = json["foodRating"];
    foodDescription = json["foodDescription"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["foodName"] = foodName;
    data["foodPrice"] = foodPrice;
    data["foodImagePath"] = foodImagePath;
    data["foodRating"] = foodRating;
    data["foodDescription"] = foodDescription;
    return data;
  }
}
