import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/products/presentation/controllers/producte_controller.dart';

class HomeSearchFieldWidget extends StatelessWidget {
  final ProductController productController = Get.find<ProductController>();
  final TextEditingController searchController = TextEditingController();

  HomeSearchFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'ابحث عن المنتج...',
          contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 234, 229, 229),
          suffixIcon: IconButton(
            icon: Icon(Icons.search, color: Colors.white, size: 24.sp),
            onPressed: () {
              productController.searchHomeProducts(searchController.text);
            },
          ),
        ),
        style: TextStyle(
          color: Colors.orange,
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
