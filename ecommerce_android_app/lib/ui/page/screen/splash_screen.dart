import 'package:ecommerce_android_app/constant/app_color.dart';
import 'package:ecommerce_android_app/ui/admin/screen/add_proudcut.dart';
import 'package:ecommerce_android_app/ui/auth/auth_network_caller/auth_network_caller.dart';
import 'package:ecommerce_android_app/ui/auth/authcontroller/auth_controller.dart';
import 'package:ecommerce_android_app/ui/auth/screen/login_screen.dart';
import 'package:ecommerce_android_app/ui/page/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpalashScreen extends StatefulWidget {
  const SpalashScreen({super.key});

  @override
  State<SpalashScreen> createState() => _SpalashScreenState();
}

class _SpalashScreenState extends State<SpalashScreen> {
  final AuthController _authController = Get.find<AuthController>();
  @override
  void initState() {
    _authController.getUserData(context: context);
    getUserData();

    super.initState();
  }

  Future<void> getUserData() async {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => _authController.token.isNotEmpty
                  ? _authController.userData.username == "admin"
                      ? const AddProduct()
                      : const MainScreen()
                  : const LoginScreen()),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.btncolor,
      body: const Center(
          child: Icon(
        Icons.shopping_bag_sharp,
        size: 150,
        color: Colors.white,
      )),
    );
  }
}
