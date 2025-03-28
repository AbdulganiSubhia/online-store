import '../models/product.dart';

class ProductData_BestSellingProducts {
final List<Product> _topon = [
  // Nike Shoes
  Product(id: 1, name: "Nike Air Max 1", imageUrl: "assets/images/shoes/shose_nike/nike1.jpg", description: "حذاء رياضي مريح.", price: 50.0, categoryId: "shoes", subCategoryId: "Nike"),
  Product(id: 2, name: "Nike Air Max 2", imageUrl: "assets/images/shoes/shose_nike/nike2.jpg", description: "تصميم أنيق وخفيف.", price: 55.0, categoryId: "shoes", subCategoryId: "Nike"),
  // Adidas Shoes
  Product(id: 11, name: "Adidas Superstar 1", imageUrl: "assets/images/shoes/shoes_adidas/adidas1.jpg", description: "حذاء كلاسيكي من Adidas.", price: 50.0, categoryId: "shoes", subCategoryId: "Adidas"),
  Product(id: 12, name: "Adidas Superstar 2", imageUrl: "assets/images/shoes/shoes_adidas/adidas2.jpg", description: "حذاء عصري ومريح.", price: 55.0, categoryId: "shoes", subCategoryId: "Adidas"),
// zara T-Shirts
  Product(id: 41, name: "Zara Dri-FIT Tee 1", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تيشيرت مريح من Nike.", price: 40.0, categoryId: "tshirt", subCategoryId: "Zara"),
  Product(id: 42, name: "Zara Dri-FIT Tee 2", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تصميم عصري وخفيف.", price: 45.0, categoryId: "tshirt", subCategoryId: "Zara"),
// Reebok T-Shirts
  Product(id: 51, name: "Reebok Originals Tee 1", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "تيشيرت رياضي من Reebok.", price: 40.0, categoryId: "tshirt", subCategoryId: "Reebok"),
  Product(id: 52, name: "Reebok Originals Tee 2", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "خامة مريحة وعالية الجودة.", price: 45.0, categoryId: "tshirt", subCategoryId: "Reebok"),
// Gucci
  Product(id: 321, name: "Gucci Essentials Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "تيشيرت بسيط ومريح للاستخدام اليومي.", price: 42.0, categoryId: "tshirt", subCategoryId: "Gucci"),
  Product(id: 322, name: "Gucci Active Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "تيشيرت رياضي مثالي للتمارين.", price: 48.0, categoryId: "tshirt", subCategoryId: "Gucci"),
  // Rolex Watches ساعات
  Product(id: 101, name: "Rolex Submariner", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة فاخرة من Rolex بتصميم كلاسيكي.", price: 200.0, categoryId: "watches", subCategoryId: "Rolex"),
  Product(id: 102, name: "Rolex Daytona", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "تصميم أنيق وجودة عالية.", price: 220.0, categoryId: "watches", subCategoryId: "Rolex"),
  // Casio Watches
  Product(id: 111, name: "Casio G-Shock", imageUrl: "assets/images/watch/watch_Casio/casio1.jpg", description: "ساعة قوية ومقاومة للصدمات.", price: 180.0, categoryId: "watches", subCategoryId: "Casio"),
  Product(id: 112, name: "Casio Edifice", imageUrl: "assets/images/watch/watch_Casio/casio2.jpg", description: "تصميم عصري وأداء قوي.", price: 200.0, categoryId: "watches", subCategoryId: "Casio"),
  // Tag Heuer Watches
  Product(id: 131, name: "Tag Heuer Carrera", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة فاخرة لعشاق السيارات.", price: 400.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
  Product(id: 132, name: "Tag Heuer Monaco", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "تصميم كلاسيكي وأنيق.", price: 420.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
  //جاكيت// North Face Jackets
  Product(id: 201, name: "North Face Thermoball", imageUrl: "assets/images/jacket/jacket_North Face/northface1.jpg", description: "جاكيت خفيف وعازل للبرودة.", price: 150.0, categoryId: "jacket", subCategoryId: "North Face"),
  Product(id: 202, name: "North Face Apex Bionic", imageUrl: "assets/images/jacket/jacket_North Face/northface2.jpg", description: "جاكيت مقاوم للرياح والماء.", price: 170.0, categoryId: "jacket", subCategoryId: "North Face"),
  // Columbia Jackets
  Product(id: 211, name: "Columbia Watertight II", imageUrl: "assets/images/jacket/jacket_Columbia/columbia2.png", description: "جاكيت مضاد للماء ومناسب للأمطار.", price: 120.0, categoryId: "jacket", subCategoryId: "Columbia"),
  Product(id: 212, name: "Columbia Bugaboo", imageUrl: "assets/images/jacket/jacket_Columbia/columbia1.png", description: "جاكيت ثلاثي الطبقات للمغامرات.", price: 180.0, categoryId: "jacket", subCategoryId: "Columbia"),
  // Patagonia Jackets
  Product(id: 221, name: "Patagonia Nano Puff", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia1.png", description: "جاكيت عازل وخفيف الوزن.", price: 160.0, categoryId: "jacket", subCategoryId: "Patagonia"),
  Product(id: 222, name: "Patagonia Torrentshell", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia2.png", description: "جاكيت مقاوم للمطر وعازل للماء.", price: 180.0, categoryId: "jacket", subCategoryId: "Patagonia"),
  // Arc'teryx Jackets
  Product(id: 231, name: "Arc'teryx Atom LT", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx1.png", description: "جاكيت خفيف ومقاوم للبرودة.", price: 250.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
];


  List<Product> get bestSellingProducts => _topon;
  

 }