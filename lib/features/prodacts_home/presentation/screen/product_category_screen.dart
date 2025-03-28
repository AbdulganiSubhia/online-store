import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/screen/products_by_category_screen.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/widgets/serch/search_field_widget.dart';
import 'package:one_project_fierbase/features/products/presentation/controllers/producte_controller.dart';
import '../../../../colors/app_colors.dart';

class SubCategoriesScreen extends StatelessWidget {
  final String categoryId;
  final ProductController controller = Get.put(ProductController());

  SubCategoriesScreen({required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.navBarBackground,
        title: Padding(
          padding: EdgeInsets.only(right: 50.w),
          child: Center(
            child: Text(
              '${categoryId.toUpperCase()}',
              style: TextStyle(fontSize: 20.sp, color: AppColors.buttonText),
            ),
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.buttonText),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SearchFieldWidget(),
          ),          Expanded(
            child: Obx(() {
              return Padding(
                padding: EdgeInsets.all(8.w),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                  ),
                  itemCount: controller.filteredSubCategories.length,
                  itemBuilder: (context, index) {
                    String subCategory = controller.filteredSubCategories[index];

                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => controller.setHoveredIndex(index), 
                      onExit: (_) => controller.setHoveredIndex(null), 
                      child: GestureDetector(
                        onTap: () {
                          controller.selectSubCategory(subCategory);
                          Get.to(() => ProductsScreen(subCategory: subCategory));
                        },
                        child: Card(
                          color: AppColors.cardBackground,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                            side: BorderSide(color: AppColors.cardBorder, width: 1.5),
                          ),
                          elevation: 4,
                          shadowColor: AppColors.cardShadow,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Image.asset(
                                    controller.getImageForSubCategory(subCategory),
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(Icons.image_not_supported, size: 50.sp, color: AppColors.textHint);
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.w),
                                  child: Text(
                                    subCategory,
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),

                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Obx(() {
                                    bool isHovered = controller.hoveredIndex.value == index;
                                    return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: isHovered ? AppColors.buttonHover : AppColors.buttonPrimary,
                                        foregroundColor: AppColors.buttonText,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.r),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                        elevation: isHovered ? 8 : 5,
                                        shadowColor: AppColors.cardShadow,
                                      ),
                                      onPressed: () {
                                        controller.selectSubCategory(subCategory);
                                        Get.to(() => ProductsScreen(subCategory: subCategory));
                                      },
                                      child: Text(
                                        "عرض المنتجات",
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
                        ),
                      ),
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
