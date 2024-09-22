import 'package:flutter/cupertino.dart';
import 'package:focal_x_task_2_provider/models/Product.dart';
import 'package:focal_x_task_2_provider/models/cart_model.dart';
import 'package:get/get.dart';

class ProductController extends ChangeNotifier {
  List<Product> products = [];
  List<CartItem> cartItems = [];

  ProductController() {
    products = [
      Product(
          name: 'product 1',
          description: 'description',
          imageUrl: 'https://via.placeholder.com/150'),
      Product(
          name: 'product 2',
          description: 'description',
          imageUrl: 'https://via.placeholder.com/150'),
      Product(
        name: 'Product 3',
        description: 'This is product 3 description.',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
    notifyListeners();
  }

  void addToCart(Product product) {
    // check if the product is already in the cart
    int index = cartItems.indexWhere((item) => item.product == product);
    // if item is not in the cart
    if (index == -1) {
      cartItems.add(CartItem(product: product, quantity: product.quantity));
    }
    // item is in the cart so just add the quantity
    else {
      cartItems[index].quantity += product.quantity;
    }
    notifyListeners();
    Get.snackbar(
        'added to cart', '${product.name} has been added to your cart');
  }

  // Remove item from cart
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    notifyListeners();
  }

  // Clear the entire cart
  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void incrementProductQuantity(int index) {
    products[index].quantity++;
    notifyListeners(); // Notify listeners to update UI
  }

  void decrementProductQuantity(int index) {
    if (products[index].quantity > 0) {
      products[index].quantity--;
      notifyListeners(); // Notify listeners to update UI
    }
  }

  // Get total quantity
  int get totalQuantity =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);
} // end class
