

import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavoriteController extends GetxController {
  var favoriteProducts = <int>{}.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavoritesFromFirestore(); 
  }

  Future<void> _loadFavoritesFromFirestore() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return; 

      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      final docSnapshot = await docRef.get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null && data['favoriteProducts'] != null) {
          final List<dynamic> favList = data['favoriteProducts'];
          favoriteProducts.addAll(favList.map((e) => e as int));
        }
      } else {
        await docRef.set({
          'favoriteProducts': <int>[],
        });
      }
    } catch (e) {
      print('Error loading favorites: $e');
    }
  }

  Future<void> toggleFavorite(int productId) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return; 

    if (favoriteProducts.contains(productId)) {
      favoriteProducts.remove(productId);
    } else {
      favoriteProducts.add(productId);
    }

    try {
      final docRef = FirebaseFirestore.instance.collection('users').doc(user.uid);
      await docRef.update({
        'favoriteProducts': favoriteProducts.toList(),
      });
    } catch (e) {
      print('Error updating favorites: $e');
    }

    
    update();
  }


  bool isFavorite(int productId) {
    return favoriteProducts.contains(productId);
  }
}


