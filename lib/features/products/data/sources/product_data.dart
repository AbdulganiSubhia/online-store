import '../models/product.dart';

class ProductData {
  final List<Product> _products = [
    // ===== SHOES =====
    // Nike Shoes
    Product(id: 1, name: "Nike Air Max 1", imageUrl: "assets/images/shoes/shose_nike/nike1.jpg", description: "حذاء رياضي مريح.", price: 50.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 2, name: "Nike Air Max 2", imageUrl: "assets/images/shoes/shose_nike/nike2.jpg", description: "تصميم أنيق وخفيف.", price: 55.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 3, name: "Nike Air Max 3", imageUrl: "assets/images/shoes/shose_nike/nike3.jpg", description: "أفضل اختيار للرياضيين.", price: 60.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 4, name: "Nike Air Max 4", imageUrl: "assets/images/shoes/shose_nike/nike1.jpg", description: "حذاء مريح ومتين.", price: 65.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 5, name: "Nike Air Max 5", imageUrl: "assets/images/shoes/shose_nike/nike2.jpg", description: "أداء عالي في الجري.", price: 70.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 6, name: "Nike Air Zoom", imageUrl: "assets/images/shoes/shose_nike/nike3.jpg", description: "خفيف وسريع.", price: 75.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 7, name: "Nike React",  imageUrl: "assets/images/shoes/shose_nike/nike1.jpg", description: "راحة إضافية.", price: 80.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 8, name: "Nike Pegasus", imageUrl: "assets/images/shoes/shose_nike/nike2.jpg", description: "تقنية متطورة للجري.", price: 85.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 9, name: "Nike Free",   imageUrl: "assets/images/shoes/shose_nike/nike3.jpg", description: "مرونة عالية.", price: 90.0, categoryId: "shoes", subCategoryId: "Nike"),
    Product(id: 10, name: "Nike Vaporfly", imageUrl: "assets/images/shoes/shose_nike/nike1.jpg", description: "أفضل أداء.", price: 100.0, categoryId: "shoes", subCategoryId: "Nike"),

    // Adidas Shoes
    Product(id: 11, name: "Adidas Superstar 1", imageUrl: "assets/images/shoes/shoes_adidas/adidas1.jpg", description: "حذاء كلاسيكي من Adidas.", price: 50.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 12, name: "Adidas Superstar 2", imageUrl: "assets/images/shoes/shoes_adidas/adidas2.jpg", description: "حذاء عصري ومريح.", price: 55.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 13, name: "Adidas Superstar 3", imageUrl: "assets/images/shoes/shoes_adidas/adidas3.jpg", description: "مصنوع بجودة عالية.", price: 60.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 14, name: "Adidas Superstar 4", imageUrl: "assets/images/shoes/shoes_adidas/adidas1.jpg", description: "خفيف الوزن.", price: 65.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 15, name: "Adidas Superstar 5", imageUrl: "assets/images/shoes/shoes_adidas/adidas2.jpg", description: "تصميم مثالي.", price: 70.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 16, name: "Adidas Ultraboost", imageUrl: "assets/images/shoes/shoes_adidas/adidas3.jpg", description: "راحة فائقة.", price: 75.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 17, name: "Adidas NMD",     imageUrl: "assets/images/shoes/shoes_adidas/adidas1.jpg", description: "تصميم حديث.", price: 80.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 18, name: "Adidas Yeezy",   imageUrl: "assets/images/shoes/shoes_adidas/adidas2.jpg", description: "أكثر الأحذية شهرة.", price: 85.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 19, name: "Adidas Stan Smith", imageUrl: "assets/images/shoes/shoes_adidas/adidas3.jpg", description: "حذاء كلاسيكي.", price: 90.0, categoryId: "shoes", subCategoryId: "Adidas"),
    Product(id: 20, name: "Adidas Gazelle",  imageUrl: "assets/images/shoes/shoes_adidas/adidas1.jpg", description: "تصميم رياضي.", price: 100.0, categoryId: "shoes", subCategoryId: "Adidas"),

    // Puma Shoes
    Product(id: 21, name: "Puma RS-X 1", imageUrl: "assets/images/shoes/shoes_Puma/puma1.jpg", description: "حذاء أنيق من Puma.", price: 50.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 22, name: "Puma RS-X 2", imageUrl: "assets/images/shoes/shoes_Puma/puma2.jpg", description: "راحة وتصميم فريد.", price: 55.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 23, name: "Puma RS-X 3", imageUrl: "assets/images/shoes/shoes_Puma/puma3.jpg", description: "تقنية متطورة.", price: 60.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 24, name: "Puma RS-X 4", imageUrl: "assets/images/shoes/shoes_Puma/puma1.jpg", description: "جودة ومتانة.", price: 65.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 25, name: "Puma RS-X 5", imageUrl: "assets/images/shoes/shoes_Puma/puma2.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 26, name: "Puma RS-X 7", imageUrl: "assets/images/shoes/shoes_Puma/puma3.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 27, name: "Puma RS-X 9", imageUrl: "assets/images/shoes/shoes_Puma/puma1.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 28, name: "Puma RS-X 8", imageUrl: "assets/images/shoes/shoes_Puma/puma2.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 29, name: "Puma RS-X 4", imageUrl: "assets/images/shoes/shoes_Puma/puma3.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),
    Product(id: 30, name: "Puma RS-X 0", imageUrl: "assets/images/shoes/shoes_Puma/puma1.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: "Puma"),

    // Fila shose
    Product(id: 31, name: " Fila_sx2", imageUrl: "assets/images/shoes/shoes_Fila/Fila1.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 32, name: " Fila_sx3", imageUrl: "assets/images/shoes/shoes_Fila/Fila2.jpg", description: "مصنوع بخامات مميزة.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 33, name: " Fila_sx4", imageUrl: "assets/images/shoes/shoes_Fila/Fila3.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 34, name: " Fila_sx5", imageUrl: "assets/images/shoes/shoes_Fila/Fila1.jpg", description: "راحة وتصميم فريد.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 35, name: " Fila_sx6", imageUrl: "assets/images/shoes/shoes_Fila/Fila2.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 36, name: " Fila_sx7", imageUrl: "assets/images/shoes/shoes_Fila/Fila3.jpg", description: "راحة وتصميم فريد.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 37, name: " Fila_sx8", imageUrl: "assets/images/shoes/shoes_Fila/Fila1.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 38, name: " Fila_sx9", imageUrl: "assets/images/shoes/shoes_Fila/Fila2.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 39, name: " Fila_sx0", imageUrl: "assets/images/shoes/shoes_Fila/Fila3.jpg", description: "راحة وتصميم فريد.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),
    Product(id: 40, name: " Fila_sx1", imageUrl: "assets/images/shoes/shoes_Fila/Fila1.jpg", description: "تصميم شبابي.", price: 70.0, categoryId: "shoes", subCategoryId: " Fila"),


// zara T-Shirts
    Product(id: 41, name: "Zara Dri-FIT Tee 1", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تيشيرت مريح من Nike.", price: 40.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 42, name: "Zara Dri-FIT Tee 2", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تصميم عصري وخفيف.", price: 45.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 43, name: "Zara Dri-FIT Tee 3", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "جودة عالية.", price: 50.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 44, name: "Zara Dri-FIT Tee 4", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "خامة ممتازة.", price: 55.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 45, name: "Zara Dri-FIT Tee 5", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تصميم رياضي.", price: 60.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 46, name: "Zara Sportswear Tee", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تيشيرت يومي مريح.", price: 65.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 47, name: "Zara Air Tee",       imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "مصنوع بخامات مميزة.", price: 70.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 48, name: "Zara Just Do It Tee", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تيشيرت كلاسيكي.", price: 75.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 49, name: "Zara Heritage Tee", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "تصميم عصري وأنيق.", price: 80.0, categoryId: "tshirt", subCategoryId: "Zara"),
    Product(id: 50, name: "Zara Performance Tee", imageUrl: "assets/images/tshirt/t_shirt_nike/nike_tee1.jpg", description: "أفضل خيار للرياضيين.", price: 85.0, categoryId: "tshirt", subCategoryId: "Zara"),

// Reebok T-Shirts
    Product(id: 51, name: "Reebok Originals Tee 1", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "تيشيرت رياضي من Reebok.", price: 40.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 52, name: "Reebok Originals Tee 2", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "خامة مريحة وعالية الجودة.", price: 45.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 53, name: "Reebok Originals Tee 3", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "تصميم شبابي وعصري.", price: 50.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 54, name: "Reebok Originals Tee 4", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "خفيف ومناسب للرياضة.", price: 55.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 55, name: "Reebok Originals Tee 5", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "تصميم رياضي كلاسيكي.", price: 60.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 56, name: "Reebok Performance Tee", imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "أفضل راحة أثناء التمارين.", price: 65.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 57, name: "Reebok Climalite Tee",   imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "يضمن الجفاف والراحة.", price: 70.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 58, name: "Reebok Trefoil Tee",     imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "تصميم أيقوني من Adidas.", price: 75.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 59, name: "Reebok Badge of Sport",  imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee1.jpg", description: "خفيف ومريح طوال اليوم.", price: 80.0, categoryId: "tshirt", subCategoryId: "Reebok"),
    Product(id: 60, name: "Reebok Street Tee",      imageUrl: "assets/images/tshirt/t_shirt_adidas/adidas_tee2.jpg", description: "تصميم عصري للشباب.", price: 85.0, categoryId: "tshirt", subCategoryId: "Reebok"),

// Gucci
    Product(id: 321, name: "Gucci Essentials Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "تيشيرت بسيط ومريح للاستخدام اليومي.", price: 42.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 322, name: "Gucci Active Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "تيشيرت رياضي مثالي للتمارين.", price: 48.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 323, name: "Gucci DryCELL Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "تقنية DryCELL للتحكم في العرق.", price: 50.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 324, name: "Gucci Rebel Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "تيشيرت عصري بتصميم فريد.", price: 45.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 325, name: "Gucci Motorsport Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "مصمم لعشاق رياضات السيارات.", price: 55.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 326, name: "Gucci Big Logo Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "تيشيرت بشعار Puma الكبير.", price: 43.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 327, name: "Gucci Training Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "مصمم لراحة أفضل أثناء التمارين.", price: 49.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 328, name: "Gucci Graphic Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "تيشيرت بطباعة جرافيك مميزة.", price: 46.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 329, name: "Gucci Street Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel1.jpg", description: "تصميم كاجوال يناسب جميع المناسبات.", price: 47.0, categoryId: "tshirt", subCategoryId: "Gucci"),
    Product(id: 330, name: "Gucci Performance Tee", imageUrl: "assets/images/tshirt/t_shirt_Puma/puma_teel2.jpg", description: "أداء عالي وجودة ممتازة.", price: 52.0, categoryId: "tshirt", subCategoryId: "Gucci"),

    // Under
    Product(id: 331, name: "Under Armour Tech Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua1.jpg", description: "تيشيرت بتقنية UA Tech يجف بسرعة.", price: 50.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 332, name: "Under Armour HeatGear Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua2.jpg", description: "تقنية HeatGear للتحكم في الرطوبة.", price: 55.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 333, name: "Under Armour Rush Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua3.jpg", description: "يدعم الأداء الرياضي بفضل تقنيته المتطورة.", price: 60.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 334, name: "Under Armour Project Rock Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua1.jpg", description: "تيشيرت بتصميم مستوحى من Project Rock.", price: 65.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 335, name: "Under Armour Sportstyle Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua2.jpg", description: "تصميم كاجوال مريح وعصري.", price: 45.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 336, name: "Under Armour Iso-Chill Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua3.jpg", description: "تقنية Iso-Chill لتبريد الجسم.", price: 62.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 337, name: "Under Armour Seamless Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua1.jpg", description: "تصميم بدون خياطة لراحة أكبر.", price: 58.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 338, name: "Under Armour Vanish Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua2.jpg", description: "خفيف الوزن بأداء عالي.", price: 53.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 339, name: "Under Armour Tactical Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua3.jpg", description: "مصمم للأنشطة الشاقة والتكتيكية.", price: 57.0, categoryId: "tshirt", subCategoryId: "Under Armour"),
    Product(id: 340, name: "Under Armour UA Freedom Tee", imageUrl: "assets/images/tshirt/t_shirt_Under/ua1.jpg", description: "تصميم خاص لدعم مبادرة UA Freedom.", price: 54.0, categoryId: "tshirt", subCategoryId: "Under Armour"),

    // Rolex Watches ساعات
    Product(id: 101, name: "Rolex Submariner", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة فاخرة من Rolex بتصميم كلاسيكي.", price: 200.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 102, name: "Rolex Daytona", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "تصميم أنيق وجودة عالية.", price: 220.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 103, name: "Rolex Datejust", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة مثالية لكل المناسبات.", price: 240.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 104, name: "Rolex Oyster Perpetual", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة أيقونية من Rolex.", price: 260.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 105, name: "Rolex Explorer", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "مصنوعة للمغامرين.", price: 280.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 106, name: "Rolex GMT-Master II", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة راقية وفخمة.", price: 300.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 107, name: "Rolex Milgauss", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "تصميم علمي حديث.", price: 320.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 108, name: "Rolex Sky-Dweller", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة سفر مثالية.", price: 340.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 109, name: "Rolex Yacht-Master", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة مستوحاة من البحر.", price: 360.0, categoryId: "watches", subCategoryId: "Rolex"),
    Product(id: 110, name: "Rolex Air-King", imageUrl: "assets/images/watch/watch_ Rolex/rolex1.jpg", description: "ساعة عصرية وأنيقة.", price: 380.0, categoryId: "watches", subCategoryId: "Rolex"),

    // Casio Watches
    Product(id: 111, name: "Casio G-Shock", imageUrl: "assets/images/watch/watch_Casio/casio1.jpg", description: "ساعة قوية ومقاومة للصدمات.", price: 180.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 112, name: "Casio Edifice", imageUrl: "assets/images/watch/watch_Casio/casio2.jpg", description: "تصميم عصري وأداء قوي.", price: 200.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 113, name: "Casio Pro Trek", imageUrl: "assets/images/watch/watch_Casio/casio3.jpg", description: "ساعة مثالية للرحلات.", price: 220.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 114, name: "Casio Vintage", imageUrl: "assets/images/watch/watch_Casio/casio4.jpg", description: "تصميم كلاسيكي أنيق.", price: 160.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 115, name: "Casio Tough Solar", imageUrl: "assets/images/watch/watch_Casio/casio5.jpg", description: "ساعة تعمل بالطاقة الشمسية.", price: 190.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 116, name: "Casio World Time", imageUrl: "assets/images/watch/watch_Casio/casio1.jpg", description: "عرض متعدد المناطق الزمنية.", price: 170.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 117, name: "Casio Oceanus", imageUrl: "assets/images/watch/watch_Casio/casio2.jpg", description: "تصميم فاخر من Casio.", price: 210.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 118, name: "Casio Baby-G", imageUrl: "assets/images/watch/watch_Casio/casio3.jpg", description: "ساعة رياضية أنيقة.", price: 150.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 119, name: "Casio Classic", imageUrl: "assets/images/watch/watch_Casio/casio4.jpg", description: "تصميم مميز وخفيف.", price: 140.0, categoryId: "watches", subCategoryId: "Casio"),
    Product(id: 120, name: "Casio Illuminator", imageUrl: "assets/images/watch/watch_Casio/casio5.jpg", description: "ساعة بإضاءة LED.", price: 130.0, categoryId: "watches", subCategoryId: "Casio"),

    // Fossil Watches
    Product(id: 121, name: "Fossil Grant", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة جلدية أنيقة.", price: 190.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 122, name: "Fossil Machine", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة بتصميم ميكانيكي.", price: 210.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 123, name: "Fossil Nate", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة كاجوال رائعة.", price: 230.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 124, name: "Fossil Neutra", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "تصميم رسمي أنيق.", price: 220.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 125, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 126, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 127, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 128, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 129, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),
    Product(id: 130, name: "Fossil Smartwatch", imageUrl: "assets/images/watch/Fossil Watches/fossil1.jpg", description: "ساعة ذكية حديثة.", price: 260.0, categoryId: "watches", subCategoryId: "Fossil"),

    // Tag Heuer Watches
    Product(id: 131, name: "Tag Heuer Carrera", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة فاخرة لعشاق السيارات.", price: 400.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 132, name: "Tag Heuer Monaco", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "تصميم كلاسيكي وأنيق.", price: 420.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 133, name: "Tag Heuer Aquaracer", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة غوص متينة.", price: 440.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 134, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 135, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 136, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 137, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 138, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 139, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),
    Product(id: 140, name: "Tag Heuer Formula 1", imageUrl: "assets/images/watch/Tag Heuer Watches/tag4.jpg", description: "ساعة رياضية سريعة.", price: 460.0, categoryId: "watches", subCategoryId: "Tag Heuer"),

    //جاكيت
    // North Face Jackets
    Product(id: 201, name: "North Face Thermoball", imageUrl: "assets/images/jacket/jacket_North Face/northface1.jpg", description: "جاكيت خفيف وعازل للبرودة.", price: 150.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 202, name: "North Face Apex Bionic", imageUrl: "assets/images/jacket/jacket_North Face/northface2.jpg", description: "جاكيت مقاوم للرياح والماء.", price: 170.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 203, name: "North Face McMurdo", imageUrl: "assets/images/jacket/jacket_North Face/northface3.png", description: "جاكيت طويل للشتاء القاسي.", price: 200.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 204, name: "North Face Venture 2", imageUrl: "assets/images/jacket/jacket_North Face/northface4.png", description: "جاكيت مقاوم للمطر وخفيف الوزن.", price: 180.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 205, name: "North Face Gotham", imageUrl: "assets/images/jacket/jacket_North Face/northface1.jpg", description: "جاكيت عصري مع بطانة دافئة.", price: 190.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 206, name: "North Face Summit Series", imageUrl: "assets/images/jacket/jacket_North Face/northface2.jpg", description: "جاكيت مثالي للمغامرات الجبلية.", price: 210.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 207, name: "North Face Dryzzle", imageUrl: "assets/images/jacket/jacket_North Face/northface3.png", description: "جاكيت مقاوم للماء بتقنية GORE-TEX.", price: 220.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 208, name: "North Face Denali", imageUrl: "assets/images/jacket/jacket_North Face/northface4.png", description: "جاكيت فليسي مريح ودافئ.", price: 160.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 209, name: "North Face Nuptse", imageUrl: "assets/images/jacket/jacket_North Face/northface1.jpg", description: "جاكيت بحشوة من الريش.", price: 230.0, categoryId: "jacket", subCategoryId: "North Face"),
    Product(id: 210, name: "North Face Resolve", imageUrl: "assets/images/jacket/jacket_North Face/northface2.jpg", description: "جاكيت عملي ومقاوم للطقس.", price: 140.0, categoryId: "jacket", subCategoryId: "North Face"),

    // Columbia Jackets
    Product(id: 211, name: "Columbia Watertight II", imageUrl: "assets/images/jacket/jacket_Columbia/columbia2.png", description: "جاكيت مضاد للماء ومناسب للأمطار.", price: 120.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 212, name: "Columbia Bugaboo", imageUrl: "assets/images/jacket/jacket_Columbia/columbia1.png", description: "جاكيت ثلاثي الطبقات للمغامرات.", price: 180.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 213, name: "Columbia Steens Mountain", imageUrl: "assets/images/jacket/jacket_Columbia/columbia3.png", description: "جاكيت فليسي دافئ ومريح.", price: 100.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 214, name: "Columbia Alpine Action", imageUrl: "assets/images/jacket/jacket_Columbia/columbia2.png", description: "جاكيت شتوي بحشوة عازلة.", price: 200.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 215, name: "Columbia Whirlibird", imageUrl: "assets/images/jacket/jacket_Columbia/columbia5.png", description: "جاكيت ثلاثي الطبقات بتقنية Omni-Heat.", price: 220.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 216, name: "Columbia Powder Lite", imageUrl: "assets/images/jacket/jacket_Columbia/columbia6.png", description: "جاكيت خفيف وعازل للحرارة.", price: 150.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 217, name: "Columbia Ascender", imageUrl: "assets/images/jacket/jacket_Columbia/columbia7.png", description: "جاكيت مقاوم للرياح.", price: 130.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 218, name: "Columbia Timberline", imageUrl: "assets/images/jacket/jacket_Columbia/columbia1.png", description: "جاكيت جبلي رائع للرحلات.", price: 190.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 219, name: "Columbia Flash Forward", imageUrl: "assets/images/jacket/jacket_Columbia/columbia2.png", description: "جاكيت خفيف الوزن وعصري.", price: 140.0, categoryId: "jacket", subCategoryId: "Columbia"),
    Product(id: 220, name: "Columbia Helvetia", imageUrl: "assets/images/jacket/jacket_Columbia/columbia3.png", description: "جاكيت مصنوع من القطن الطبيعي.", price: 110.0, categoryId: "jacket", subCategoryId: "Columbia"),

    // Patagonia Jackets
    Product(id: 221, name: "Patagonia Nano Puff", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia1.png", description: "جاكيت عازل وخفيف الوزن.", price: 160.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 222, name: "Patagonia Torrentshell", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia2.png", description: "جاكيت مقاوم للمطر وعازل للماء.", price: 180.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 223, name: "Patagonia Down Sweater", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia3.png", description: "جاكيت بحشوة من الريش الطبيعي.", price: 220.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 224, name: "Patagonia Frozen Range", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia4.png", description: "جاكيت شتوي عالي الجودة.", price: 250.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 225, name: "Patagonia Houdini", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia5.png", description: "جاكيت خفيف ومثالي للرياح.", price: 140.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 226, name: "Patagonia Tres 3-in-1", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia6.png",description:" جاكيت متعدد الاستخدامات.", price: 270.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 227, name: "Patagonia Isthmus", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia1.png", description: "جاكيت مقاوم للرياح والمطر.", price: 190.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 228, name: "Patagonia R1 TechFace", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia2.png", description: "جاكيت ناعم وخفيف.", price: 200.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 229, name: "Patagonia Silent Down", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia3.png", description: "جاكيت شتوي دافئ.", price: 230.0, categoryId: "jacket", subCategoryId: "Patagonia"),
    Product(id: 230, name: "Patagonia Woolyester", imageUrl: "assets/images/jacket/jacket_Patagonia/patagonia4.png", description: "جاكيت مصنوع من الصوف الطبيعي.", price: 175.0, categoryId: "jacket", subCategoryId: "Patagonia"),

    // Arc'teryx Jackets
    Product(id: 231, name: "Arc'teryx Atom LT", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx1.png", description: "جاكيت خفيف ومقاوم للبرودة.", price: 250.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 232, name: "Arc'teryx Beta AR", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx2.png", description: "جاكيت مقاوم للماء بتقنية GORE-TEX.", price: 300.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 233, name: "Arc'teryx Camosun", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx3.png", description: "جاكيت شتوي رسمي وأنيق.", price: 270.0, categoryId: "jacket", subCategoryId: "Arc'teryx"),
    Product(id: 234, name: "Arc'teryx Cerium LT", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx4.png", description: "جاكيت فائق العزل وخفيف الوزن.", price: 280.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 235, name: "Arc'teryx Fission SV", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx5.png", description: "جاكيت مقاوم للثلوج.", price: 320.0, categoryId: "jacket", subCategoryId: "Arc'teryx"),
    Product(id: 236, name: "Arc'teryx Zeta SL", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx6.png", description: "جاكيت عملي للمشي.", price: 260.0, categoryId: "jacket", subCategoryId: "Arc'teryx"),
    Product(id: 237, name: "Arc'teryx Thorium AR", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx1.png", description: "جاكيت بحشوة الريش الطبيعي.", price: 290.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 238, name: "Arc'teryx Norvan SL", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx2.png", description: "جاكيت للجري والرياضة.", price: 210.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 239, name: "Arc'teryx Proton LT", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx3.png", description: "جاكيت للأجواء الباردة.", price: 275.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
    Product(id: 240, name: "Arc'teryx Gamma LT", imageUrl: "assets/images/jacket/jacket_Arc'teryx/arcteryx4.png", description: "جاكيت متعدد الاستخدامات.", price: 240.0, categoryId: "jacket", subCategoryId: "Arc teryx"),
  ];

  List<Product> get products => _products;


}