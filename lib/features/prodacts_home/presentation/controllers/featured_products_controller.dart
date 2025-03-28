
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../products/presentation/controllers/producte_controller.dart';

class FeaturedProductsController extends GetxController {
  final ProductController productController = Get.find<ProductController>();
  final PageController pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startAutoScroll();
    });
  }

  void _startAutoScroll() {
    if (productController.products.isEmpty) return; 

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (!pageController.hasClients) return; 

      if (currentPage < productController.products.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
