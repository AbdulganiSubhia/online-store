import 'package:flutter/material.dart';

class AppColors {
  // خلفية الصفحة
  static const Color background = Color(0xFFF9F9F9); // أبيض أو رمادي فاتح جدًا

  // الأزرار
  static const Color buttonPrimary = Color(0xFFFF6B00); // برتقالي
  static const Color buttonSecondary = Color(0xFFE63946); // أحمر
  static const Color buttonText = Colors.white; // نص الأزرار أبيض

  // الحقول
  static const Color fieldBackground = Colors.white; // خلفية الحقل
  static const Color fieldBorder = Color(0xFFCCCCCC); // حدود رمادية
  static const Color fieldText = Color(0xFF333333); // نص غامق

  // الكارد (بطاقات المنتجات)
  static const Color cardBackground = Color(0xFFFFFFFF); // أبيض نقي لسهولة القراءة
  static const Color cardBorder = Color(0xFFE0E0E0); // حدود رمادية فاتحة
  static const Color cardShadow = Color(0x0D000000); // ظل خفيف جداً (شفافية منخفضة)

  // الأزرار داخل الكارد
  static const Color cardButton = Color(0xFFFF6B00); // برتقالي
  static const Color cardButtonText = Colors.white; // نص أبيض

  // شريط التنقل (Navigation Bar)
  static const Color navBarBackground = Color.fromARGB(135, 24, 101, 124); // أزرق غامق
  static const Color navBarText = Colors.white; // نصوص بيضاء

  // ألوان النصوص
  static const Color textPrimary = Color(0xFF1E1E1E); // لون النص الأساسي (أسود داكن)
  static const Color textSecondary = Color(0xFF4A4A4A); // لون النص الثانوي (رمادي غامق)
  static const Color textHint = Color(0xFF9E9E9E); // لون النص التلميحي (رمادي فاتح)
  static const Color textError = Color(0xFFE63946); // لون النص للأخطاء (أحمر)
  static const Color textSuccess = Color(0xFF28A745); // لون النص للنجاح (أخضر)

  static const Color buttonHover = Color.fromARGB(255, 197, 75, 18); // لون الزر عند تمرير الماوس
  static const Color cardHover = Color.fromARGB(255, 173, 172, 172); // لون عند تمرير الماوس على الكارد
  
  static const Color primary = Color.fromARGB(255, 238, 28, 0);
}
