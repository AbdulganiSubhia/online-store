
import 'package:one_project_fierbase/features/products/data/models/product.dart';
import '../sources/product_data.dart';

class ProductService {
  static Future<List<Product>> getProducts() async {
    return ProductData().products;
  }
}