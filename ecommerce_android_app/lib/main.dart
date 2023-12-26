import 'package:ecommerce_android_app/ui/auth/repository/auth_repository.dart';
import 'package:ecommerce_android_app/ui/auth/controller/auth_controller.dart';
import 'package:ecommerce_android_app/ui/page/controller/home_controller.dart';
import 'package:ecommerce_android_app/ui/page/repository/home_repository.dart';

import 'package:ecommerce_android_app/ui/page/screen/splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ecommerce app',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.white70,
            elevation: 3,
          ),
        ),
      ),
      // themeMode: themeController.theme,
      // home: const DetailsScreen(),
      home: const SpalashScreen(),
      // home: const AddProduct()
      initialBinding: ControllerBinder(),
    );
  }
}

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(NetworkCaller()));
    Get.put(HomeController(HomeRepository()));
  }
}
