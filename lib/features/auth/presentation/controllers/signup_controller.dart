
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  var isLoading = false.obs;
  var errorMessage = "".obs;

  Future<void> signUp() async {
    isLoading.value = true;
    errorMessage.value = "";
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'fullName': fullNameController.text,
        'email': emailController.text,
      });

      Get.toNamed('/login');
    } catch (e) {
      errorMessage.value = "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void signUpWithGoogle() {
  }

  void signUpWithFacebook() {
  }
}

