// lib/main.dart
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:one_project_fierbase/core/transitions/transaltions.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/onboarding_screen.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/splash_screen.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/SignUp_Screen.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/screen/home_screen.dart';
import 'package:one_project_fierbase/features/auth/presentation/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
 
  void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}
class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), 
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute:'/splash',
          getPages: [
            GetPage(name: '/splash', page: () =>  SplashScreen()),
            GetPage(name: '/onboarding', page: () =>  OnboardingScreen()),
            GetPage(name: '/login', page: () =>  LoginPage()),
            GetPage(name: '/signup', page: () =>  SignUpScreen()),
            GetPage(name: '/home', page: () => HomeScreen()),
          ],
        );
      },
    );
  }
}

