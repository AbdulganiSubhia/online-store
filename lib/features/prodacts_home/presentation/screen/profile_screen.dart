import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../colors/app_colors.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  ProfileScreen({super.key});

  Widget _buildTextField(String label, TextEditingController controller, String hint, {bool readOnly = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.bold,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: AppColors.fieldBackground,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.cardShadow,
                blurRadius: 4.r,
                spreadRadius: 1.r,
              ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            style: TextStyle(
              color: AppColors.buttonSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14.sp),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.buttonPrimary,
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.navBarText,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.saveProfileData,
            icon: Icon(Icons.save, color: AppColors.buttonText),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  Obx(() => CircleAvatar(
                        radius: 70.r,
                        backgroundImage: (controller.profileImagePath.value.isNotEmpty)
                            ? FileImage(File(controller.profileImagePath.value)) as ImageProvider
                            : AssetImage('assets/images/login.png'),
                      )),
                  Positioned(
                    bottom: 5.h,
                    right: 5.w,
                    child: GestureDetector(
                      onTap: controller.pickImage,
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: AppColors.fieldBackground,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.cardShadow,
                              blurRadius: 5.r,
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.camera_alt_outlined,
                          size: 24.sp,
                          color: AppColors.buttonPrimary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            _buildTextField("Full Name", TextEditingController(text: controller.fullName.value), "", readOnly: true),
            _buildTextField("Email", TextEditingController(text: controller.email.value), "", readOnly: true),
            _buildTextField("Date Of Birth", controller.dobController.value, "DD/MM/YYYY"),
            _buildTextField("Phone", controller.phoneController.value, "Enter your phone number"),
            _buildTextField("Country", controller.countryController.value, "Enter your country"),
            _buildTextField("State", controller.stateController.value, "Enter your state"),
            _buildTextField("City", controller.cityController.value, "Enter your city"),
            _buildTextField("Address", controller.addressController.value, "Enter your full address"),
          ],
        ),
      ),
    );
  }
}
