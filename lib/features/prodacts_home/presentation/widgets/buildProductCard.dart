import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/colors/app_colors.dart';
import 'package:one_project_fierbase/features/products/presentation/screen/product_details_screen.dart';
import '../controllers/favorite_controller.dart';

Widget buildProductCard(product) {

  final favoriteController = Get.find<FavoriteController>();

  return GestureDetector(
    onTap: () => Get.to(() => ProductDetailsScreen(product: product, Products: null)),
    child: Padding(
      padding: EdgeInsets.only(left: 20.w),
      child: Container(
        width: 400.w, 
        height: 500.h, 
        margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: AppColors.cardBackground, 
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.cardShadow, 
              blurRadius: 5.r,
              spreadRadius: 5.r,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 8.h),
              child: SizedBox(
                height: 40.h,
                width: 40.w,
                
                child: Align(
                  alignment: Alignment.topRight,
                  child: Obx(() {
                    bool isFavorite = favoriteController.isFavorite(product.id);
                    return IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite
                            ? Colors.red
                            : const Color.fromARGB(255, 232, 132, 132),
                        size: 35.sp,
                      ),
                      onPressed: () {
                        favoriteController.toggleFavorite(product.id);
                      },
                    );
                  }),
                ),
              ),
            ),

            Center(
              child: Padding(
                padding: EdgeInsets.all( 1,),
                child: SizedBox(
                  height: 185.h,
                  width: 250.w, 
                  child: ClipOval(
                    child: Image.asset(
                      product.imageUrl,
                      height: 150.h,
                      width: 150.w,
                      fit: BoxFit.cover, 
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(Icons.broken_image,
                            size: 100.sp, color: Colors.grey);
                      },
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 15.h),
              child: Center(
                child: Text(
                  product.name,
                  style: TextStyle(
                    color: AppColors.textPrimary, 
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 30.w, top: 15.h),
                  child: Center(
                    child: Text(
                      '\$${product.price.toStringAsFixed(1)}',
                      style: TextStyle(
                        color: AppColors.buttonPrimary,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                        wordSpacing: 2,
                        height: 1.5,
                        shadows: [
                          Shadow(
                            color: AppColors.textError, 
                            blurRadius: 4.r,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 15.h, right: 10.w),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.cardButton, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                    ),
                    onPressed: () {
                      Get.to(() => ProductDetailsScreen(
                            product: product,
                            Products: null,
                          ));
                    },
                    child: Text(
                      "View Details",
                      style: TextStyle(
                        color: AppColors.cardButtonText, 
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
