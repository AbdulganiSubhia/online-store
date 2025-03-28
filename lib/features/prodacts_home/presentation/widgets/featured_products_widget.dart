import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../colors/app_colors.dart';
import '../../../products/presentation/controllers/producte_controller.dart';
import '../controllers/featured_products_controller.dart';
import 'buildProductCard.dart';

class FeaturedProductsWidget extends StatefulWidget {
  final ScrollController scrollController;
  final GlobalKey targetKey; 

  FeaturedProductsWidget({Key? key, required this.scrollController, required this.targetKey})
      : super(key: key);

  @override
  _FeaturedProductsWidgetState createState() => _FeaturedProductsWidgetState();
}

class _FeaturedProductsWidgetState extends State<FeaturedProductsWidget> {
  final FeaturedProductsController controller = Get.put(FeaturedProductsController());
  final PageController pageController = PageController(viewportFraction: 0.7);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageController.hasClients) {
        if (pageController.page == controller.productController.bestSellingProducts.length - 1) {
          pageController.jumpToPage(0);
        } else {
          pageController.nextPage(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 18.w, bottom: 25.h, top: 30.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " 🔥 Featured Products",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_downward, color: AppColors.primary),
                onPressed: () {
                  if (widget.targetKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      widget.targetKey.currentContext!,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        SizedBox(
          height: 360.h,
          child: Obx(() {
            if (controller.productController.isLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.primary),
                ),
              );
            }
            final bestSellingProducts = controller.productController.bestSellingProducts;
            return PageView.builder(
              controller: pageController,
              itemCount: bestSellingProducts.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: pageController,
                  builder: (context, child) {
                    double scaleFactor = 1.0;
                    double translation = 0.0;
                    if (pageController.position.haveDimensions) {
                      double page = pageController.page ?? 0.0;
                      double difference = (index - page).abs();
                      scaleFactor = 1 - (difference * 0.1);
                      translation = difference * -20.w;
                    }
                    return Transform(
                      transform: Matrix4.identity()
                        ..scale(scaleFactor)
                        ..translate(translation, 0),
                      alignment: Alignment.center,
                      child: buildProductCard(bestSellingProducts[index]),
                    );
                  },
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
