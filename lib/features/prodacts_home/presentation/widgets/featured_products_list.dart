import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/products/data/models/product.dart';
import '../../../products/presentation/controllers/producte_controller.dart';
import 'buildProductListItem.dart';

class FeaturedProductsList extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  FeaturedProductsList({super.key, required RxList<Product> products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.only(left: 18.w,top: 20.h),
          child: Text(
            "🛒 All Products",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 212, 117, 8),
            ),
          ),
        ),
        Obx(() {
          if (productController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: productController.allProducts.length,
            itemBuilder: (context, index) {
              final product = productController.allProducts[index];
              return buildProductListItem(product);
            },
          );
        }),
      ],
    );
  }
}
