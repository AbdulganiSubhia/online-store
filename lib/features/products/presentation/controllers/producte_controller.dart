import 'package:get/get.dart';
import 'package:one_project_fierbase/features/products/data/models/product.dart';
import 'package:one_project_fierbase/features/products/data/sources/product_data.dart';
import '../../data/sources/sub_prodact_data.dart';
class ProductController extends GetxController {
  var products = <Product>[].obs;
  var allProducts = <Product>[].obs;
  
  var filteredProducts = <Product>[].obs;

  var filteredAllProducts = <Product>[].obs;
  var filteredBestSellingProducts = <Product>[].obs;
  
  var isLoading = true.obs;

  var selectedCategory = "".obs;
  var selectedSubCategory = "".obs;

  var filteredSubCategories = <String>[].obs;

  var favoriteProducts = <String>{}.obs;

  var hoveredIndex = RxnInt();

  var bestSellingProducts = <Product>[].obs;
  var allbestSellingProducts = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchbestSellingProducts();
  }

  void setHoveredIndex(int? index) {
    hoveredIndex.value = index;
  }

  String getImageForSubCategory(String subCategoryId) {
    return 'assets/images/Sub-Products/$subCategoryId.jpg';
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2)); 
      final productData = ProductData();
      products.assignAll(productData.products);
      allProducts.assignAll(productData.products); 

      filteredAllProducts.assignAll(allProducts);
    } finally {
      isLoading(false);
    }
  }

  void fetchbestSellingProducts() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 2)); 
      final productData = ProductData_BestSellingProducts();
      bestSellingProducts.assignAll(productData.bestSellingProducts);
      allbestSellingProducts.assignAll(productData.bestSellingProducts);

      filteredBestSellingProducts.assignAll(allbestSellingProducts);
    } finally {
      isLoading(false);
    }
  }

  void selectCategory(String categoryId) {
    selectedCategory.value = categoryId;
    selectedSubCategory.value = "";
    if (categoryId == "shoes") {
      filteredSubCategories.assignAll(['Adidas', 'Puma', 'Nike', 'Fila']);
    } else if (categoryId == "tshirt") {
      filteredSubCategories.assignAll(['Zara', 'Reebok', 'Gucci', 'Under Armou']);
    } else if (categoryId == "watches") {
      filteredSubCategories.assignAll(['Rolex', 'Casio', 'Fossil', 'Tag Heuer']);
    } else if (categoryId == "jacket") {
      filteredSubCategories.assignAll(['North Face', 'Columbia', 'Patagonia', 'Arc teryx']);
    } else {
      filteredSubCategories.assignAll([]);
    }
    update();
  }

  void selectSubCategory(String subCategoryId) {
    selectedSubCategory.value = subCategoryId;
    filteredProducts.assignAll(
      products.where((p) => p.subCategoryId == subCategoryId).toList(),
    );
    update();
  }

  List<String> getSubCategoriesByCategory(String categoryId) {
    return products
        .where((product) => product.categoryId == categoryId)
        .map((product) => product.subCategoryId)
        .toSet()
        .toList();
  }

  void filterSubCategoriesByCategory(String categoryId) {
    if (categoryId == "shoes") {
      filteredSubCategories.assignAll(['Adidas', 'Puma', 'Nike', 'Fila']);
    } else if (categoryId == "tshirt") {
      filteredSubCategories.assignAll(['Zara', 'Reebok', 'Gucci', 'Under Armou']);
    } else if (categoryId == "watches") {
      filteredSubCategories.assignAll(['Rolex', 'Casio', 'Fossil', 'Tag Heuer']);
    } else if (categoryId == "jacket") {
      filteredSubCategories.assignAll(['North Face', 'Columbia', 'Patagonia', 'Arc teryx']);
    } else {
      filteredSubCategories.assignAll([]);
    }
    update();
  }

  void searchHomeProducts(String query) {
    if (query.isEmpty) {
      filteredAllProducts.assignAll(allProducts);
      filteredBestSellingProducts.assignAll(allbestSellingProducts);
    } else {
      final lowerQuery = query.toLowerCase();
      filteredAllProducts.assignAll(
        allProducts.where((p) => p.name.toLowerCase().contains(lowerQuery)).toList(),
      );
      filteredBestSellingProducts.assignAll(
        allbestSellingProducts.where((p) => p.name.toLowerCase().contains(lowerQuery)).toList(),
      );
    }
    update();
  }

  void searchProduct(String query) {
    if (query.isEmpty) {
      filteredProducts.assignAll(
        products.where((p) => p.subCategoryId == selectedSubCategory.value).toList(),
      );
    } else {
      filteredProducts.assignAll(
        products.where((p) =>
          p.subCategoryId == selectedSubCategory.value &&
          p.name.toLowerCase().contains(query.toLowerCase())
        ).toList(),
      );
    }
    update();
  }

  void searchSubCategory(String query) {
    if (query.isEmpty) {
      filterSubCategoriesByCategory(selectedCategory.value);
    } else {
      final lowerQuery = query.toLowerCase();
      final filtered = filteredSubCategories.where((subCat) {
        return subCat.toLowerCase() == lowerQuery;
      }).toList();
      filteredSubCategories.assignAll(filtered);
    }
    update();
  }

  void toggleFavoriteStatus(String productId) {
    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }
  }

  bool isFavorite(String productId) {
    return favoriteProducts.contains(productId);
  }
}
