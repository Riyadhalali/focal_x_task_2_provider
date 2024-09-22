import 'package:flutter/material.dart';
import 'package:focal_x_task_2_provider/views/cart_screen/screen/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../../models/Product.dart';
import '../controller/product_controller.dart';

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List with GetBuilder'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartPage
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
        ],
      ),
      body: Consumer<ProductController>(
        builder: (context, controller, child) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              Product product = controller.products[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Product Image
                      Image.network(
                        product.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(product.description),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                // Decrease Button
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    controller.decrementProductQuantity(index);
                                  },
                                ),
                                // Quantity Display
                                Text(
                                  '${product.quantity}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                // Increase Button
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    controller.incrementProductQuantity(index);
                                  },
                                ),
                                SizedBox(width: 20),
                                // Add to Cart Button
                                ElevatedButton(
                                  child: Text('Add to Cart'),
                                  onPressed: () {
                                    controller.addToCart(product);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                '${product.name} added to cart')));
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
