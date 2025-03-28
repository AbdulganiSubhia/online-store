

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final String categoryId;
  final String subCategoryId;

  Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.categoryId,
    required this.subCategoryId,
  });

    factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      price: json['price'],
      categoryId: json['categoryId'],
      subCategoryId: json['subCategoryId'],
    );
  }
}
