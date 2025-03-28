import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_project_fierbase/features/auth/presentation/controllers/login_controller.dart';
import 'package:one_project_fierbase/features/auth/presentation/widgets/ui/primary_button.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final LoginController controller = Get.put(LoginController());
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isHovering = false;
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


  Widget _buildAnimatedTextFieldWithIcon({
    required String label,
    required IconData icon,
    required bool obscureText,
    required Function(String) onChanged,
    String? Function(String?)? validator,
  }) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: _animation.value,
      child: SlideTransition(
        position: Tween<Offset>(
                begin: const Offset(0, 0.5), end: Offset.zero)
            .animate(
          CurvedAnimation(
              parent: _animationController, curve: Curves.easeInOut),
        ),
        child: TextFormField(
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
            fillColor: Colors.white.withOpacity(0.1),
          ),
          onChanged: onChanged,
          validator: validator,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      controller.login();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60.w, top: 5.h),
            child: Text(
              'Log in to the App ',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.italic,
                fontSize: 20.sp,
              ),
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
                image: AssetImage('assets/images/login.png'),
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
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 40.h),
                    child: Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: size.height - 80.h,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedDefaultTextStyle(
                                duration: const Duration(milliseconds: 500),
                                style: TextStyle(
                                  fontSize: 30.sp * _animation.value,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.lock,
                                  size: 92.sp * _animation.value,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                ' LogIn ',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10.0,
                                      color: const Color.fromARGB(255, 60, 144, 212),
                                      offset: Offset(2.w, 2.h),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30.h),
                              _buildAnimatedTextFieldWithIcon(
                                label: ' E_mail',
                                icon: Icons.email,
                                obscureText: false,
                                onChanged: (value) =>
                                    controller.email.value = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال البريد الإلكتروني';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              _buildAnimatedTextFieldWithIcon(
                                label: 'Password ',
                                icon: Icons.lock,
                                obscureText: true,
                                onChanged: (value) =>
                                    controller.password.value = value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'الرجاء إدخال كلمة المرور';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 20.h),
                              Obx(() => controller.errorMessage.value.isNotEmpty
                                  ? Text(
                                      controller.errorMessage.value,
                                      style: TextStyle(color: Colors.red, fontSize: 16.sp),
                                    )
                                  : SizedBox.shrink()),
                              SizedBox(height: 20.h),
                              Obx(
                                () => PrimaryButtonWidget(
                                  lable: 'Login To The Application ',
                                  isLoading: controller.isLoading.value,
                                  onPressed: _submitForm,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed('/signup');
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  onEnter: (_) {
                                    setState(() {
                                      _isHovering = true;
                                    });
                                  },
                                  onExit: (_) {
                                    setState(() {
                                      _isHovering = false;
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 20.h),
                                    child: Text(
                                      "Don't Have an Account?  Register now   ",
                                      style: TextStyle(
                                        color: _isHovering ? Colors.red : Colors.blue,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
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
