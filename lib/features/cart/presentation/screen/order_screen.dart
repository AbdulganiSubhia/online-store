import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../colors/app_colors.dart';
import '../controllers/orders_controller.dart';

class OrdersScreen extends StatelessWidget {
  OrdersScreen({Key? key}) : super(key: key);

  final OrdersController ordersController = Get.put(OrdersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          "طلباتي",
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: AppColors.buttonPrimary,
        elevation: 2,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Obx(() {
        if (ordersController.orders.isEmpty) {
          return Center(
            child: Text(
              "لا يوجد طلبات بعد",
              style: TextStyle(fontSize: 18.sp),
            ),
          );
        }
        return ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: ordersController.orders.length,
          itemBuilder: (context, index) {
            final order = ordersController.orders[index];

            int orderNumber = order['orderNumber'] ?? (index + 1);
            String orderId = order['orderId'] ?? "غير متوفر";

            String orderDate = "غير متوفر";
            if (order['timestamp'] != null && order['timestamp'] is Timestamp) {
              orderDate = DateFormat('yyyy-MM-dd – kk:mm')
                  .format((order['timestamp'] as Timestamp).toDate());
            }

            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
                side: BorderSide(color: AppColors.cardBorder, width: 1),
              ),
              margin: EdgeInsets.only(bottom: 16.h),
              color: AppColors.cardBackground,
              child: ExpansionTile(
                tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order Number:  $orderNumber",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "التاريخ: $orderDate",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _confirmDeleteOrder(context, orderId),
                    ),
                  ],
                ),
                subtitle: Text(
                  "المجموع: \$${(order['total'] ?? 0.0).toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 14.sp, color: AppColors.buttonPrimary),
                ),
                children: [
                  Divider(),
                  Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      children: List.generate(
                        (order['items'] as List).length,
                        (itemIndex) {
                          final item = order['items'][itemIndex];

                          // Convert stored color index to an actual Color.
                          final dynamic colorData = item['color'];
                          final List<Color> availableColors = [Colors.yellow, Colors.purple, Colors.black, Colors.red, Colors.blue];
                          Color color;
                          if (colorData is int && colorData >= 0 && colorData < availableColors.length) {
                            color = availableColors[colorData];
                          } else {
                            color = Colors.grey;
                          }

                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 8.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.asset(
                                    item['imageUrl'] ?? 'assets/default_image.png',
                                    width: 80.w,
                                    height: 80.w,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['name'] ?? 'Unnamed Product',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        "المقاس: US ${item['size'] ?? 'غير متوفر'}",
                                        style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        children: [
                                          Text(
                                            "اللون:",
                                            style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            width: 18.w,
                                            height: 18.w,
                                            decoration: BoxDecoration(
                                              color: color,
                                              shape: BoxShape.circle,
                                              border: Border.all(color: AppColors.fieldBorder),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 2.h),
                                      Text(
                                        "الكمية: ${item['quantity'] ?? 1}",
                                        style: TextStyle(fontSize: 14.sp, color: AppColors.textSecondary),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }

  void _confirmDeleteOrder(BuildContext context, String orderId) {
    Get.defaultDialog(
      title: "حذف الطلب",
      middleText: "هل أنت متأكد أنك تريد حذف هذا الطلب؟",
      textConfirm: "نعم",
      textCancel: "إلغاء",
      confirmTextColor: Colors.white,
      onConfirm: () {
        ordersController.deleteOrder(orderId);
        Get.back();
      },
    );
  }
}
