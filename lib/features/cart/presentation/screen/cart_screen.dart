import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';
import '../../../cart/presentation/controllers/orders_controller.dart';
import '../widgets/totale_sction.dart';
import 'order_screen.dart';
import '../../../../colors/app_colors.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final OrdersController ordersController = Get.put(OrdersController());

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(
            color: AppColors.buttonText,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.buttonPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.buttonText, size: 24.sp),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.separated(
                padding: EdgeInsets.all(16.w),
                itemCount: controller.cartItems.length,
                separatorBuilder: (_, __) => SizedBox(height: 12.h),
                itemBuilder: (_, index) {
                  final item = controller.cartItems[index];
                  return _buildCartItem(item);
                },
              ),
            ),
          ),
          TotalSection(),
        ],
      ),
    );
  }

  Widget _buildCartItem(Map<String, dynamic> item) {
    final String docId = item['docId'];
    final String size = item['size']?.toString() ?? 'N/A';
    
    Color color;
    final dynamic colorData = item['color'];
    final List<Color> availableColors = [Colors.yellow, Colors.purple, Colors.black, Colors.red, Colors.blue];
    if (colorData is int && colorData >= 0 && colorData < availableColors.length) {
      color = availableColors[colorData];
    } else {
      color = Colors.grey;
    }

    final double price = item['price'] != null && item['price'] is num
        ? (item['price'] as num).toDouble()
        : 0.0;

    final int quantity = item['quantity'] ?? 1;

    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.cardShadow,
            spreadRadius: 5.r,
            blurRadius: 7.r,
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item['imageUrl'] ?? 'assets/default_image.png',
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16.w),
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
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Text(
                      'Size: $size',
                      style: TextStyle(color: AppColors.textHint, fontSize: 14.sp),
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        Text(
                          'Color:',
                          style: TextStyle(color: AppColors.textHint, fontSize: 14.sp),
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
                  ],
                ),
                SizedBox(height: 6.h),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: AppColors.buttonPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: AppColors.cardBackground.withOpacity(0.9),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove,
                          color: AppColors.textError, size: 24.sp),
                      onPressed: () {
                        if (quantity > 1) {
                          controller.updateQuantity(docId, quantity - 1);
                        } else {
                          controller.removeFromCart(docId);
                        }
                      },
                    ),
                    Text(
                      "$quantity",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add,
                          color: AppColors.textSuccess, size: 24.sp),
                      onPressed: () {
                        controller.updateQuantity(docId, quantity + 1);
                      },
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete_outline,
                    color: AppColors.textError, size: 24.sp),
                onPressed: () {
                  controller.removeFromCart(docId);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
