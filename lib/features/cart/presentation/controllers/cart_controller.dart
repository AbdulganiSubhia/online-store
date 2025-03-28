import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  // Reactive list that holds cart items data.
  var cartItems = <Map<String, dynamic>>[].obs;

  // Firestore and FirebaseAuth instances.
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    listenToCartChanges();

    auth.authStateChanges().listen((user) {
      if (user != null) {
        listenToCartChanges();
      } else {
        cartItems.clear();
      }
    });
  }

  void listenToCartChanges() {
    final user = auth.currentUser;
    if (user == null) return;

    firestore
        .collection('users')
        .doc(user.uid)
        .collection('cart')
        .snapshots()
        .listen(
      (snapshot) {
        cartItems.assignAll(snapshot.docs.map((doc) {
          var data = doc.data();
          data['docId'] = doc.id;
          return data;
        }).toList());
      },
      onError: (error) {
        Get.snackbar("Error", "Failed to load cart items: $error");
      },
    );
  }


  Future<void> addToCart(Map<String, dynamic> product, int value) async {
    final user = auth.currentUser;
    if (user == null) return;

    final cartRef = firestore.collection('users').doc(user.uid).collection('cart');

    final existingItemQuery = await cartRef
        .where('id', isEqualTo: product['id'])
        .where('size', isEqualTo: product['size'])
        .where('color', isEqualTo: product['color'])
        .get();

    if (existingItemQuery.docs.isNotEmpty) {
      final existingDoc = existingItemQuery.docs.first;
      int newQuantity = existingDoc['quantity'] + (product['quantity'] ?? 1);
      await cartRef.doc(existingDoc.id).update({'quantity': newQuantity});
      Get.snackbar("Updated", "Product quantity updated");
    } else {
      await cartRef.add({
        ...product,
        'quantity': product['quantity'] ?? 1,
        'addedAt': Timestamp.now(),
      });
      Get.snackbar("Added", "Product added to cart");
    }
  }


  Future<void> updateQuantity(String docId, int newQuantity) async {
    final user = auth.currentUser;
    if (user == null) return;

    final cartRef = firestore.collection('users').doc(user.uid).collection('cart');

    if (newQuantity > 0) {
      await cartRef.doc(docId).update({'quantity': newQuantity});
    } else {
      await removeFromCart(docId);
    }
  }

  Future<void> removeFromCart(String docId) async {
    final user = auth.currentUser;
    if (user == null) return;

    await firestore.collection('users').doc(user.uid).collection('cart').doc(docId).delete();
    Get.snackbar("Removed", "Product removed from cart");
  }

  Future<void> clearCart() async {
    final user = auth.currentUser;
    if (user == null) return;

    final cartRef = firestore.collection('users').doc(user.uid).collection('cart');
    final batch = firestore.batch();

    final cartSnapshot = await cartRef.get();
    for (var doc in cartSnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
    Get.snackbar("Cart Cleared", "Your cart has been emptied");
  }

  double get totalPrice {
    return cartItems.fold(0.0, (sum, item) {
      final price = (item['price'] is num) ? item['price'].toDouble() : 0.0;
      final qty = (item['quantity'] is num) ? item['quantity'] : 1;
      return sum + price * qty;
    });
  }

  Future<void> placeOrder(Map<String, dynamic> orderData) async {
    final user = auth.currentUser;
    if (user == null) {
      Get.snackbar("Error", "No user is logged in");
      return;
    }
    if (cartItems.isEmpty) {
      Get.snackbar("Error", "Cart is empty");
      return;
    }
    final total = totalPrice;

    try {
      await firestore.collection('users').doc(user.uid).collection('orders').add({
        'items': cartItems.map((item) {
          return {
            ...item,
            'addedAt': item['addedAt'] is Timestamp ? item['addedAt'] : Timestamp.now(),
          };
        }).toList(),
        'total': total,
        'timestamp': FieldValue.serverTimestamp(),
        'status': 'processing',
      });

      await clearCart();
      Get.snackbar("Success", "Order placed successfully", snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", "Failed to place order: $e");
    }
  }

  Future<void> updateCartItem(String docId, Map<String, dynamic> updatedData) async {
    final user = auth.currentUser;
    if (user == null) return;

    await firestore.collection('users').doc(user.uid).collection('cart').doc(docId).update(updatedData);
    Get.snackbar("Updated", "Product details updated");
  }

  getTotalPrice() {}
}
