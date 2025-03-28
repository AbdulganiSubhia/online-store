import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ImagePicker _picker = ImagePicker();


  RxString fullName = ''.obs;
  RxString email = ''.obs;
  RxString profileImagePath = ''.obs;
  RxString selectedGender = 'Male'.obs;

  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> dobController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> stateController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> addressController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserMainData();
    _loadProfileData();
  }


  Future<void> _loadUserMainData() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    final docSnapshot = await _firestore.collection('users').doc(user.uid).get();
    if (docSnapshot.exists) {
      final data = docSnapshot.data();
      fullName.value = data?['fullName'] ?? '';
      email.value = data?['email'] ?? user.email!;
    }
  }

  Future<void> _loadProfileData() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    profileImagePath.value = prefs.getString('profile_image') ?? '';

    final docSnapshot = await _firestore
        .collection('users')
        .doc(user.uid)
        .collection('info')
        .doc('profileData')
        .get();

    if (docSnapshot.exists) {
      final data = docSnapshot.data()!;
      dobController.value.text = data['date_of_birth'] ?? '';
      selectedGender.value = data['gender'] ?? 'Male';
      phoneController.value.text = data['phone'] ?? '';
      countryController.value.text = data['country'] ?? '';
      stateController.value.text = data['state'] ?? '';
      cityController.value.text = data['city'] ?? '';
      addressController.value.text = data['address'] ?? '';
    }
  }


  Future<void> pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImagePath.value = pickedFile.path;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('profile_image', pickedFile.path);
    }
  }

  Future<void> saveProfileData() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection('info')
          .doc('profileData')
          .set({
        'date_of_birth': dobController.value.text,
        'gender': selectedGender.value,
        'phone': phoneController.value.text,
        'country': countryController.value.text,
        'state': stateController.value.text,
        'city': cityController.value.text,
        'address': addressController.value.text,
      }, SetOptions(merge: true));

      Get.snackbar("نجاح", "تم حفظ البيانات بنجاح", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("خطأ", "فشل في حفظ البيانات: $e", snackPosition: SnackPosition.BOTTOM);
    }
  }
}
