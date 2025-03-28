import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SplashController extends GetxController
    with SingleGetTickerProviderMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void onInit() {
    super.onInit();
    _initAnimations();
    _redirectToHome();
  }

  void _initAnimations() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );


    scaleAnimation = Tween<double>(begin: 0.4, end: 1.1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.elasticOut,
      ),
    );

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.1).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeIn,
      ),
    );


    slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.decelerate,
      ),
    );

    animationController.forward();
  }

  void _redirectToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed('/onboarding');
    });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}