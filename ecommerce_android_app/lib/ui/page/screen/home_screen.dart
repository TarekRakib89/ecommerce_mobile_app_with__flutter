import 'package:ecommerce_android_app/ui/page/controller/home_controller.dart';
import 'package:ecommerce_android_app/ui/page/screen/detail_screen.dart';
import 'package:ecommerce_android_app/ui/widget/categories_products.dart';

import 'package:ecommerce_android_app/ui/drawers/profile_drawer.dart';
import 'package:ecommerce_android_app/ui/widget/image_slider_with_Swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  final HomeController _homeController = Get.find<HomeController>();

  @override
  void initState() {
    getProductData();
    super.initState();
  }

  void getProductData() {
    _homeController.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () => displayDrawer(context),
            icon: const Icon(Icons.menu),
          );
        }),
        actions: [
          SizedBox(
            height: 40,
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "Search",
                  contentPadding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  )),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Icon(
            Icons.notifications_none,
            size: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ImageSliderWithSwiper(size: size),
              const SizedBox(
                height: 10,
              ),
              CategoriesProducts(size: size),
              SizedBox(
                height: size.height * 0.51,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product Feature",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    GetBuilder<HomeController>(builder: (homeController) {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () => homeController.getProductData(),
                          child: GridView.builder(
                            itemCount: homeController.product.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () => Get.offAll(() => DetailsScreen(
                                    productItem:
                                        homeController.product[index])),
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          height: 130,
                                          width: 170,
                                          decoration: const BoxDecoration(),
                                          child: Image.network(
                                            homeController
                                                .product[index].imageUrl![0],
                                            fit: BoxFit.cover,
                                          )),
                                      Text(_homeController.product[index].price
                                          .toString())
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const Profile(),
    );
  }
}
