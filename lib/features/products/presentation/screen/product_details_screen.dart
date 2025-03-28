import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../cart/presentation/controllers/cart_controller.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;
  final CartController cartController = Get.put(CartController());

  final RxInt quantity = 1.obs;
  final RxInt selectedSize = 7.obs;
  final RxInt selectedColor = 0.obs;

  final List<String> colorNames = ["أصفر", "أرجواني", "أسود", "أحمر", "أزرق"];
  final List<Color> colorOptions = [Colors.yellow, Colors.purple, Colors.black, Colors.red, Colors.blue];
  final List<int> sizeOptions = [6, 7, 8, 9];

  ProductDetailsScreen({super.key, required this.product, required Products});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final double totalPrice = product.price * quantity.value;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMainImage(),
              SizedBox(height: 16.h),
              _buildThumbnailImages(),
              SizedBox(height: 16.h),
              _buildProductTitle(),
              SizedBox(height: 8.h),
              _buildPriceAndRating(),
              SizedBox(height: 16.h),
              _buildDescriptionAndQuantityControl(),
              SizedBox(height: 16.h),
              _buildProductDescription(),
              SizedBox(height: 16.h),
              _buildSizeSelection(),
              SizedBox(height: 16.h),
              _buildColorSelection(),
              SizedBox(height: 70.h),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(() {
        final double totalPrice = product.price * quantity.value;
        return FloatingActionButton.extended(
          backgroundColor: Colors.orange,
          onPressed: () {
            cartController.addToCart({
              'id': product.id,
              'name': product.name,
              'price': product.price,
              'imageUrl': product.imageUrl,
              'quantity': quantity.value,
              'size': selectedSize.value,
              'color': selectedColor.value,
            }, product.id);
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                        ),
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: Container(
                            width: 80.w,
                            height: 80.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2.w),
                            ),
                            child: ClipOval(
                              child: Image.asset(
                                product.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.r),
                            bottomRight: Radius.circular(16.r),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.celebration, color: Colors.orange, size: 28.sp),
                                SizedBox(width: 8.w),
                                Text(
                                  "تمت الإضافة بنجاح!",
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "تمت إضافة ${product.name} إلى سلة المشتريات",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "العدد المطلوب: ${quantity.value}",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Color(0xFF800000),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "الإضافات المختارة",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.3),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "US ${selectedSize.value}",
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.w),
                                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(8.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orange.withOpacity(0.3),
                                        blurRadius: 4.r,
                                        offset: Offset(0, 2.h),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    colorNames[selectedColor.value],
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16.h),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "تم",
                                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          label: Text("أضف إلى السلة (\$${totalPrice.toStringAsFixed(2)})", style: TextStyle(fontSize: 16.sp)),
          icon: Icon(Icons.shopping_cart, size: 24.sp),
        );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        product.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black, size: 24.sp),
    );
  }

  Widget _buildMainImage() {
    return Center(
      child: Container(
        width: 250.w,
        height: 250.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5.r,
              blurRadius: 7.r,
              offset: Offset(0, 3.h),
            ),
          ],
        ),
        child: ClipOval(
          child: Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailImages() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Container(
            width: 50.w,
            height: 50.w,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 1.w),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              product.imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        );
      }),
    );
  }

  Widget _buildProductTitle() {
    return Center(
      child: Text(
        product.name,
        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  Widget _buildPriceAndRating() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Row(
        children: [
          Text(
            "\$${product.price}",
            style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.orange),
          ),
          const Spacer(),
          Row(
            children: List.generate(5, (index) {
              return Icon(
                index < 4 ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 20.sp,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionAndQuantityControl() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("الوصف", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Obx(() => Row(
                children: [
                  _quantityButton(Icons.remove_circle, () => quantity.value > 1 ? quantity.value-- : null),
                  SizedBox(width: 8.w),
                  Text("${quantity.value}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8.w),
                  _quantityButton(Icons.add_circle, () => quantity.value++),
                ],
              )),
        ],
      ),
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: Colors.orange, size: 24.sp),
    );
  }

  Widget _buildProductDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Text(
        product.description,
        style: TextStyle(fontSize: 16.sp, height: 1.5, color: Colors.grey.shade800),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildSizeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Available Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: sizeOptions.map((size) {
            return Obx(() => GestureDetector(
                  onTap: () => selectedSize.value = size,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8.w),
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: selectedSize.value == size ? Colors.orange : Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: Colors.grey.shade300, width: 1.w),
                    ),
                    child: Text("US $size", style: TextStyle(fontSize: 16.sp, color: selectedSize.value == size ? Colors.white : Colors.black)),
                  ),
                ));
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildColorSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text("Available Colors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 8.h),
        Padding(
          padding: EdgeInsets.only(left: 50.w,right: 50.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(colorOptions.length, (index) {
              return _colorCircle(index, colorOptions[index]);
            }),
          ),
        ),
      ],
    );
  }

  Widget _colorCircle(int index, Color color) {
    return Obx(() => GestureDetector(
          onTap: () => selectedColor.value = index,
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: color,
            child: selectedColor.value == index ? Icon(Icons.check, color: Colors.white, size: 18.sp) : null,
          ),
        ));
  }

  Widget _buildAddToCartButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          cartController.addToCart({
            'id': product.id,
            'name': product.name,
            'price': product.price,
            'imageUrl': product.imageUrl,
            'quantity': quantity.value,
            'size': selectedSize.value,
            'color': selectedColor.value,
          }, product.id);
          showDialog(
            context: Get.context!,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      padding: EdgeInsets.all(16.w),
                      child: Center(
                        child: Container(
                          width: 80.w,
                          height: 80.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2.w),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.r),
                          bottomRight: Radius.circular(16.r),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.celebration, color: Colors.orange, size: 28.sp),
                              SizedBox(width: 8.w),
                              Text(
                                "تمت الإضافة بنجاح!",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "تمت إضافة ${product.name} إلى سلة المشتريات",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "العدد المطلوب: ${quantity.value}",
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Color(0xFF800000),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "الإضافات المختارة",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange.withOpacity(0.3),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  "US ${selectedSize.value}",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.orange.withOpacity(0.3),
                                      blurRadius: 4.r,
                                      offset: Offset(0, 2.h),
                                    ),
                                  ],
                                ),
                                child: Text(
                                  colorNames[selectedColor.value],
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "تم",
                              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 12.h),
        ),
        child: Text("أضف إلى السلة (\$${(product.price * quantity.value).toStringAsFixed(2)})",
            style: TextStyle(fontSize: 16.sp, color: Colors.white)),
      ),
    );
  }
}
