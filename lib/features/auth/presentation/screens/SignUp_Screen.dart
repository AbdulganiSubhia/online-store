import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_project_fierbase/features/auth/presentation/controllers/signup_controller.dart';

import '../widgets/ui/primary_button.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  final SignUpController controller = Get.put(SignUpController());
  late AnimationController _animationController;
  late Animation<double> _animation;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this, 
      duration: const Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      controller.signUp();
    }
  }

  Widget _buildAnimatedTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
  }) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _animation.value,
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.5),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
            prefixIcon: Icon(icon, color: Colors.white, size: 24.sp),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white.withOpacity(1), width: 1.w),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.w),
            ),
            filled: true,
            fillColor: Colors.black.withOpacity(0.1),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter $label';
            }
            if (label == 'Email' && !GetUtils.isEmail(value)) {
              return 'Invalid email format';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildSocialButton(BuildContext context, String text, IconData icon, Color bgColor, VoidCallback? onPressed) {
    Widget iconWidget;
    if (icon == FontAwesomeIcons.google) {
      iconWidget = ShaderMask(
        shaderCallback: (bounds) => const LinearGradient(
          colors: [
            Color(0xFF4285F4), // أزرق
            Color(0xFFDB4437), // أحمر
            Color(0xFFF4B400), // أصفر
            Color(0xFF0F9D58), // أخضر
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds),
        child: const Icon(
          FontAwesomeIcons.google,
          size: 24,
          color: Colors.white,
        ),
      );
    } else if (icon == FontAwesomeIcons.facebook) {
      iconWidget = const Icon(
        FontAwesomeIcons.facebook,
        size: 24,
        color: Color(0xFF1877F2),
      );
    } else {
      iconWidget = Icon(
        icon,
        size: 24,
        color: Theme.of(context).primaryColor,
      );
    }
    Color textColor = bgColor == Colors.white ? Colors.black : Colors.white;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: textColor,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconWidget,
          SizedBox(width: 10.w),
          Text(text, style: TextStyle(color: textColor, fontSize: 16.sp)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Sign Up',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontSize: 20.sp,
            ),
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/register.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: Transform.translate(
                  offset: Offset(0, 50.h * (1 - _animation.value)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: size.height - 80.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 500),
                                style: TextStyle(
                                  fontSize: 30.sp * _animation.value,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                child: const Text(
                                  'Sign Up',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 30.h),
                              _buildAnimatedTextField(
                                controller: controller.fullNameController,
                                label: 'Full Name',
                                icon: Icons.person,
                              ),
                              SizedBox(height: 20.h),
                              _buildAnimatedTextField(
                                controller: controller.emailController,
                                label: 'Email',
                                icon: Icons.email,
                              ),
                              SizedBox(height: 20.h),
                              _buildAnimatedTextField(
                                controller: controller.passwordController,
                                label: 'Password',
                                icon: Icons.lock,
                                obscureText: true,
                              ),
                              SizedBox(height: 20.h),
                               Obx(
                                () => PrimaryButtonWidget(
                                  lable: 'Create an Account',
                                  isLoading: controller.isLoading.value,
                                  onPressed: _submitForm,
                                ),
                              ),
                              // ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Expanded(child: Divider(color: Colors.grey.shade400)),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Text("Or", style: TextStyle(color: Colors.white, fontSize: 16.sp)),
                                  ),
                                  Expanded(child: Divider(color: Colors.grey.shade400)),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              _buildSocialButton(
                                context,
                                "Sign Up with Google",
                                FontAwesomeIcons.google,
                                Colors.white,
                                controller.signUpWithGoogle,
                              ),
                              SizedBox(height: 10.h),
                              _buildSocialButton(
                                context,
                                "Sign Up with Facebook",
                                FontAwesomeIcons.facebook,
                                Colors.blue,
                                controller.signUpWithFacebook,
                              ),
                              SizedBox(height: 20.h),
                              Center(
                                child: GestureDetector(
                                  onTap: () => Get.toNamed('/login'),
                                  child: Text(
                                    "Already have an account? Log In",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ),
                              if (controller.errorMessage.value.isNotEmpty)
                                Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Text(
                                    controller.errorMessage.value,
                                    style: TextStyle(color: Colors.red, fontSize: 16.sp),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
