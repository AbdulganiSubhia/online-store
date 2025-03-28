import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/login_screen.dart';


import 'SignUp_Screen.dart';

class OnboardingScreen extends StatelessWidget {
  final buttonScale = 1.0.obs;

   OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF5F5F5), 
              Color(0xFFE0E0E0), 
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Colors of Fashion',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                      color: Colors.blue,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 24.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                    },
                    child: Hero(
                      tag: 'main-image',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: AspectRatio(
                          aspectRatio: 3/4,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 15,
                                  spreadRadius: 3,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                              image: const DecorationImage(
                                image: AssetImage('assets/images/splash2.png'),
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                            child: const DecoratedBox(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.black12,
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  Text(
                    "Let's\nget started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.orange,
                      height: 1.3,
                      shadows: [
                        Shadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Everything starts from here',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                children: [
                  Obx(
                        () => Transform.scale(
                      scale: buttonScale.value,
                      child: ElevatedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          buttonScale.value = 0.95;
                          Future.delayed(const Duration(milliseconds: 100), () {
                            buttonScale.value = 1.0;
                          });
                          Get.to(() =>  SignUpScreen(),
                            transition: Transition.rightToLeftWithFade,
                            duration: const Duration(milliseconds: 800),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          side: const BorderSide(color: Colors.white54, width: 2),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),
                  Obx(
                        () => Transform.scale(
                      scale: buttonScale.value,
                      child: OutlinedButton(
                        onPressed: () {
                          HapticFeedback.lightImpact();
                          buttonScale.value = 0.95;
                          Future.delayed(const Duration(milliseconds: 100), () {
                            buttonScale.value = 1.0;
                          });
                          Get.to(() => const LoginPage(),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          side: const BorderSide(color: Colors.white54, width: 2),
                          minimumSize: const Size(double.infinity, 55),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}