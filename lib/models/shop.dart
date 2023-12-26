import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'food.dart';

class Shop extends ChangeNotifier{
  // final List<Food> _foodMenu = [
  //   //salmon sushi
  //   Food(
  //     foodName: "Salmon sushi",
  //     foodPrice: "20.0",
  //     foodImagePath: "images/sushi.png",
  //     foodRating: "4.8",
  //     foodDescription: "aeffsfdasdfsagsgsadgsd",
  //   ),
  //   // tuna
  //   Food(
  //     foodName: "Tuna",
  //     foodPrice: "22.0",
  //     foodImagePath: "images/sushi.png",
  //     foodRating: "4.5",
  //     foodDescription: "aeffsfdasdfsagsgsadgsd",
  //   ),
  // ];

  final _db = FirebaseFirestore.instance;

  Future<List<Food>> fetchFoodMenu() async {
      final snapshot = await _db.collection("food").get();
      final foodData = snapshot.docs.map((e) => Food.fromSnapshot(e)).toList();
      return foodData;
  }

  final List<Food> _cart = [];
  final List<Food> _foodMenu = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}