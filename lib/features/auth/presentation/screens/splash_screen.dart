import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: controller.scaleAnimation,
              child: FadeTransition(
                opacity: controller.fadeAnimation,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 3.w),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10.r,
                        spreadRadius: 3.r,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.all(8.w),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/splash2.png',
                      width: 200.w,
                      height: 200.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            SlideTransition(
              position: controller.slideAnimation,
              child: FadeTransition(
                opacity: controller.fadeAnimation,
                child: Text(
                  'Colors of Fashion',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    shadows: [
                      Shadow(
                        color: Colors.black12,
                        blurRadius: 4.r,
                        offset: Offset(2.w, 2.h),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
