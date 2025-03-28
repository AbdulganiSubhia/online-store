import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/products/presentation/controllers/producte_controller.dart';
import 'package:one_project_fierbase/features/products/presentation/screen/product_details_screen.dart';
import '../../../../colors/app_colors.dart';
import '../widgets/serch/serch_prodact.dart';

class ProductsScreen extends StatelessWidget {
  final String subCategory;
  final ProductController controller = Get.put(ProductController());

  ProductsScreen({required this.subCategory});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.selectSubCategory(subCategory);
    });

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.navBarBackground,
        title: Padding(
          padding: EdgeInsets.only(right: 50.w),
          child: Center(
            child: Text(
              subCategory,
              style: TextStyle(fontSize: 20.sp, color: AppColors.buttonText),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.buttonText),
      ),
      body: Column(
        children: [
          ProductSearchFieldWidget(),

          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 2.w, right: 2.w),
              child: Obx(() {
                if (controller.filteredProducts.isEmpty) {
                  return Center(
                    child: Text(
                      "لا توجد منتجات متاحة.",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textHint),
                    ),
                  );
                }

                return ListView.builder(
                  itemCount: controller.filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = controller.filteredProducts[index];

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => controller.setHoveredIndex(index),
                      onExit: (_) => controller.setHoveredIndex(null),
                      child: Obx(() {
                        bool isHovered = controller.hoveredIndex.value == index;
                        return GestureDetector(
                          onTap: () => Get.to(() => ProductDetailsScreen(product: product, Products: null)),
                          child: Card(
                            color: isHovered ? AppColors.cardHover : AppColors.cardBackground,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.r),
                              side: BorderSide(color: AppColors.cardBorder, width: 1.5),
                            ),
                            margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                            elevation: isHovered ? 8 : 5,
                            shadowColor: AppColors.cardShadow,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.horizontal(left: Radius.circular(18.r)),
                                  child: Image.asset(
                                    product.imageUrl,
                                    height: 150.h,
                                    width: 100.w,
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.broken_image, size: 100.sp, color: AppColors.textHint);
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product.name,
                                          style: TextStyle(
                                            color: AppColors.textPrimary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.visible,
                                          softWrap: true,
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
                                        var favoriteController = Get.find<ProductController>();
                                        bool isFavorite = favoriteController.isFavorite(product.id.toString());
                                        return MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: IconButton(
                                            icon: Icon(
                                              isFavorite ? Icons.favorite : Icons.favorite_border,
                                              color: isFavorite ? Colors.red : AppColors.textHint,
                                              size: 30.sp,
                                            ),
                                            onPressed: () {
                                              favoriteController.toggleFavoriteStatus(product.id.toString());
                                            },
                                          ),
                                        );
                                      }),
                                      SizedBox(height: 10.h),
                                      MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Obx(() {
                                          bool isButtonHovered = controller.hoveredIndex.value == index;
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: isButtonHovered ? AppColors.buttonHover : AppColors.buttonPrimary,
                                              foregroundColor: AppColors.buttonText,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15.r),
                                              ),
                                              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                              elevation: isButtonHovered ? 8 : 5,
                                              shadowColor: AppColors.cardShadow,
                                            ),
                                            onPressed: () {
                                              Get.to(() => ProductDetailsScreen(product: product, Products: null));
                                            },
                                            child: Text(
                                              "عرض التفاصيل",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
