import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  void login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      errorMessage.value = 'البريد الإلكتروني أو كلمة المرور مطلوبة';
      return;
    }
    isLoading.value = true;
    errorMessage.value = "";
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );
      errorMessage.value = '';
      Get.offAllNamed('/home');
    } catch (e) {
      errorMessage.value = 'البريد الإلكتروني أو كلمة المرور خاطئة';
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAllNamed('/signup');
    } catch (e) {
      print("خطأ أثناء تسجيل الخروج: $e");
    }
  }
}
