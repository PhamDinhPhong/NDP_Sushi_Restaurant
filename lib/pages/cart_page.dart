import 'package:flutter/material.dart';
import 'package:ndp_sushi_restaurant/global/global.dart';
import 'package:ndp_sushi_restaurant/models/shop.dart';
import 'package:provider/provider.dart';
import '../components/button.dart';
import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void  removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();

    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder: (context, value, child) =>
          Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              title: const Text("My Cart",),
              backgroundColor: primaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: value.cart.length,
                      itemBuilder: (context, index) {
                        final Food food = value.cart[index];

                        final String foodName = food.foodName!;

                        final String foodPrice = food.foodPrice!;

                        return Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.only(
                              left: 20, top: 20, right: 20),
                          child: ListTile(
                              title: Text(
                                foodName,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                  foodPrice,
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                  )
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete, color: Colors.grey[300],),
                                onPressed: () => removeFromCart(food, context),
                              )
                          ),
                        );
                      }
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: MyButton(
                    text: "Pay Now",
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
    );
  }
}

