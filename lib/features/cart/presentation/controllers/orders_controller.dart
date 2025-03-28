import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  // Reactive list to store orders fetched from Firestore
  final RxList<Map<String, dynamic>> orders = <Map<String, dynamic>>[].obs;
  
  // Firestore and FirebaseAuth instances
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    listenToOrders();
  }

  void listenToOrders() {
    final user = auth.currentUser;
    if (user == null) return; 
    firestore
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      orders.assignAll(snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['orderId'] = doc.id; 
        return data;
      }).toList());
    }, onError: (error) {
      Get.snackbar("Error", "Failed to fetch orders: $error");
    });
  }

  /// Adds a new order to Firestore with a sequential order number.
  Future<void> addOrder(Map<String, dynamic> orderData) async {
    final user = auth.currentUser;
    if (user == null) return; 

    final ordersCollection = firestore
        .collection('users')
        .doc(user.uid)
        .collection('orders');

    final snapshot = await ordersCollection.get();
    final int orderNumber = snapshot.docs.length + 1;

    await ordersCollection.add({
      ...orderData,
      'orderNumber': orderNumber, 
      'timestamp': FieldValue.serverTimestamp(), 
    });
  }

  Future<void> deleteOrder(String orderId) async {
    final user = auth.currentUser;
    if (user == null) return; 

    await firestore
        .collection('users')
        .doc(user.uid)
        .collection('orders')
        .doc(orderId)
        .delete();
  }
}
