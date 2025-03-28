import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../products/presentation/controllers/producte_controller.dart';
import '../../../products/presentation/screen/product_details_screen.dart';
import '../controllers/favorite_controller.dart';
import '../../../../colors/app_colors.dart'; 

class FavoritesScreen extends StatelessWidget {
  final FavoriteController favoriteController = Get.put(FavoriteController());
  final ProductController productController = Get.find();

  FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background, 
      appBar: AppBar(
        backgroundColor: AppColors.buttonPrimary,
        title: Padding(
          padding: EdgeInsets.only(top: 10.h),
          child: Text(
            'Favorites',
            style: TextStyle(
              color: AppColors.navBarText, 
              fontWeight: FontWeight.bold,
              fontSize: 22.sp,
            ),
          ),
        ),
        centerTitle: true,
        elevation: 5,
      ),
      body: Obx(() {
        final favoriteProducts = productController.products
            .where((product) => favoriteController.isFavorite(product.id))
            .toList();

        if (favoriteProducts.isEmpty) {
          return Center(
            child: Text(
              "No favorites added yet!",
              style: TextStyle(fontSize: 18.sp, color: AppColors.textPrimary),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 7.h),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.65,
            ),
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              return GestureDetector(
                onTap: () => Get.to(() => ProductDetailsScreen(product: product, Products: null)),
                child: Card(
                  color: AppColors.cardBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  elevation: 6,
                  shadowColor: AppColors.cardShadow, 
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Center(
                          child: ClipOval(
                            child: product.imageUrl.startsWith('http')
                                ? Image.network(
                                    product.imageUrl,
                                    height: 140.h,
                                    width: 140.h, 
                                    fit: BoxFit.cover,
                                  )
                                : Image.asset(
                                    product.imageUrl,
                                    height: 140.h,
                                    width: 140.h, 
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h), 
                      Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                  color: AppColors.textPrimary, 
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    color: AppColors.cardButton, 
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Obx(() {
                                  bool isFavorite = favoriteController.isFavorite(product.id);
                                  return IconButton(
                                    icon: Icon(
                                      isFavorite ? Icons.favorite : Icons.favorite_border,
                                      color: isFavorite ? AppColors.buttonSecondary : AppColors.textHint, 
                                    ),
                                    onPressed: () {
                                      favoriteController.toggleFavorite(product.id);
                                    },
                                  );
                                }),
                              ],
                            ),
                            SizedBox(height: 8.h),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }
}
