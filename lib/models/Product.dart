class Product {
  String name;
  String description;
  String imageUrl;
  int quantity;

  Product({
    required this.name,
    required this.description,
    required this.imageUrl,
    this.quantity = 1,
  });
}
