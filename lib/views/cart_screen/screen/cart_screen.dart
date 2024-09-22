import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../product_screen/controller/product_controller.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Provider.of<ProductController>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              // Clear the cart
              productController.clearCart();
            },
          ),
        ],
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          if (controller.cartItems.isEmpty) {
            return Center(child: Text('Your cart is empty!'));
          } else {
            return ListView.builder(
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                var cartItem = controller.cartItems[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Product Image
                        Image.network(
                          cartItem.product.imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        // Product Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItem.product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(cartItem.product.description),
                              SizedBox(height: 10),
                              Text('Quantity: ${cartItem.quantity}'),
                            ],
                          ),
                        ),
                        // Remove Button
                        IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            controller.removeFromCart(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
