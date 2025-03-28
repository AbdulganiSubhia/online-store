import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/screen/favorites_screen.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/screen/profile_screen.dart';
import 'package:one_project_fierbase/features/cart/presentation/controllers/cart_controller.dart';
import 'package:one_project_fierbase/features/prodacts_home/presentation/widgets/side_menu_widget.dart';
import 'package:one_project_fierbase/features/products/presentation/controllers/producte_controller.dart';
import 'package:one_project_fierbase/features/cart/presentation/screen/cart_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import '../../../cart/presentation/screen/order_screen.dart';
import '../widgets/featured_products_list.dart';
import '../widgets/featured_products_widget.dart';
import '../widgets/serch/HomeSearchFieldWidget.dart';
import '../widgets/serch/search_field_widget.dart';
import '../../../../colors/app_colors.dart';
import '../widgets/serch/serch_prodact.dart';
import 'product_category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ProductController productController = Get.put(ProductController());
  final CartController cartController = Get.put(CartController());
  final ScrollController mainScrollController = ScrollController();
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    FavoritesScreen(),
    ProfileScreen(),
    CartScreen(),
    OrdersScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      body: _pages[_selectedIndex],
      drawer: SideMenuWidget(),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.favorite,
          Icons.person,
          Icons.shopping_cart,
          Icons.shopping_cart_checkout_rounded
        ],
        activeIndex: _selectedIndex,
        gapLocation: GapLocation.none,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        elevation: 8,
        backgroundColor: AppColors.navBarBackground,
        activeColor: AppColors.buttonPrimary,
        inactiveColor: AppColors.textHint,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  final ScrollController scrollController = ScrollController();
  final GlobalKey featuredProductsListKey = GlobalKey();

  Future<String?> getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profile_image');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideMenuWidget(),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 70.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: AppColors.fieldBackground,
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.menu, color: AppColors.textHint, size: 28.sp),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  Text(
                    "🛍️ Colors of Fashion",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.buttonPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  InkWell(
                    onTap: () => Get.to(() => ProfileScreen()),
                    child: FutureBuilder<String?>(
                      future: getProfileImage(),
                      builder: (context, snapshot) {
                        Widget profileImage = ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            'assets/images/login.png',
                            width: 50.w,
                            height: 50.h,
                            fit: BoxFit.cover,
                          ),
                        );
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData &&
                            snapshot.data!.isNotEmpty) {
                          profileImage = ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              File(snapshot.data!),
                              width: 50.w,
                              height: 50.h,
                              fit: BoxFit.cover,
                            ),
                          );
                        }
                        return profileImage;
                      },
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.w, top: 20.h),
              child: Text(
                "الخيار الافضل للتسوق من أفضل الماركات العالمية",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: AppColors.buttonPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10.h),
            HomeSearchFieldWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    categoryButton("👟 أحذية", "shoes"),
                    categoryButton("🧥 جواكيت", "tshirt"),
                    categoryButton("🧣 كنزات", "jacket"),
                    categoryButton("⌚ ساعات", "watches"),
                  ],
                ),
              ),
            ),
            FeaturedProductsWidget(
              scrollController: scrollController,
              targetKey: featuredProductsListKey,
            ),
            Obx(() {
              if (productController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return FeaturedProductsList(
                key: featuredProductsListKey,
                products: productController.filteredAllProducts,
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget categoryButton(String text, String categoryId) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => Get.snackbar(
          "التصنيف",
          "فتح تصنيف $text",
          backgroundColor: AppColors.buttonPrimary.withOpacity(0.8),
          colorText: AppColors.buttonText,
        ),
        child: ElevatedButton(
          onPressed: () {
            productController.filterSubCategoriesByCategory(categoryId);
            Get.to(() => SubCategoriesScreen(categoryId: categoryId));
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            backgroundColor: AppColors.buttonPrimary,
            foregroundColor: AppColors.buttonText,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(text, style: TextStyle(fontSize: 16.sp)),
        ),
      ),
    );
  }
}
