import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/products/presentation/screen/product_details_screen.dart';
import '../../../../colors/app_colors.dart';
import '../controllers/favorite_controller.dart';

Widget buildProductListItem(product) {
  final favoriteController = Get.find<FavoriteController>();

  return GestureDetector(
    onTap: () => Get.to(() => ProductDetailsScreen(product: product, Products: null)),
    child: Padding(
      padding: EdgeInsets.all(8.w),
      child: Card(
        color: AppColors.cardBackground, 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        elevation: 5,
        shadowColor: AppColors.cardShadow, 
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(3.w),
              child: ClipOval(
                child: Image.asset(
                  product.imageUrl,
                  height: 100.h,
                  width: 120.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(Icons.broken_image, size: 100.sp, color: Colors.grey);
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(2.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        product.name,
                        style: TextStyle(
                          color: AppColors.textPrimary, 
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: AppColors.buttonPrimary, 
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 18.w, bottom: 10.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() {
                    bool isFavorite = favoriteController.isFavorite(product.id);
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : const Color.fromARGB(255, 221, 143, 143),
                        size: 30.sp,
                      ),
                      onPressed: () {
                        favoriteController.toggleFavorite(product.id);
                      },
                    );
                  }),
                  SizedBox(height: 10.h),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cardButton, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    ),
                    onPressed: () {
                      Get.to(() => ProductDetailsScreen(product: product, Products: null));
                    },
                    child: Text(
                      "View Details",
                      style: TextStyle(
                        color: AppColors.cardButtonText,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
