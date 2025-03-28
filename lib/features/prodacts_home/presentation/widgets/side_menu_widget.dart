import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/auth/presentation/controllers/login_controller.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/SignUp_Screen.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../controllers/profile_controller.dart';
import '../screen/favorites_screen.dart';
import '../screen/profile_screen.dart';
import '../../../../colors/app_colors.dart';

class SideMenuWidget extends StatelessWidget {
  final ProfileController profileController = Get.find<ProfileController>();
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(134, 0, 0, 0),
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Obx(() => UserAccountsDrawerHeader(
                  accountName: Text(
                    profileController.fullName.value.isNotEmpty
                        ? profileController.fullName.value
                        : "User Name",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                        color: AppColors.navBarText),
                  ),
                  accountEmail: Text(
                    profileController.email.value.isNotEmpty
                        ? profileController.email.value
                        : "user@example.com",
                    style: TextStyle(fontSize: 16.sp, color: AppColors.navBarText),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: profileController.profileImagePath.value.isNotEmpty
                        ? FileImage(File(profileController.profileImagePath.value))
                        : const AssetImage('assets/images/login.png') as ImageProvider,
                  ),
                  decoration: BoxDecoration(color: AppColors.primary),
                )),
            SizedBox(height: 10.h), 
            _buildDrawerItem(Icons.home, "Home", () => Get.back()),
            SizedBox(height: 10.h),
            _buildDrawerItem(Icons.person, "Profile", () => Get.to(() => ProfileScreen())),
            SizedBox(height: 10.h),
            _buildDrawerItem(Icons.favorite, "Favorites", () => Get.to(() => FavoritesScreen())),
            SizedBox(height: 10.h),
            _buildDrawerItem(Icons.settings, "Settings", () {}),
            SizedBox(height: 10.h),
            _buildDrawerItem(Icons.logout, "Logout", () => confirmLogout()),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Card(
        color: AppColors.cardBackground,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: ListTile(
          leading: Icon(icon, color: AppColors.buttonPrimary, size: 28.sp),
          title: Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 18.sp),
          ),
          onTap: onTap,
          hoverColor: AppColors.cardHover,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }

  void confirmLogout() {
    Get.defaultDialog(
      title: "تأكيد تسجيل الخروج",
      titleStyle: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold,color: Colors.black),
      middleText: "هل أنت متأكد أنك تريد تسجيل الخروج؟",
      middleTextStyle: TextStyle(fontSize: 16.sp,color: Colors.red),
      backgroundColor: Colors.white,
      radius: 10.r,
      textCancel: "إلغاء",
      cancelTextColor: AppColors.textPrimary,
      textConfirm: "نعم",
      confirmTextColor: Colors.white,
      buttonColor: AppColors.buttonPrimary,
      onConfirm: () {
        controller.logout(); 
        
        Get.offAll(() => SignUpScreen()); 
      },
    );
  }
}
