import 'package:ecommerce_android_app/constant/app_color.dart';
import 'package:ecommerce_android_app/ui/auth/authcontroller/auth_controller.dart';
import 'package:ecommerce_android_app/ui/auth/screen/signup_screen.dart';
import 'package:ecommerce_android_app/ui/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEdithingController =
      TextEditingController();
  AuthController _authController = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 60),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Icon(
                  Icons.shopping_bag_sharp,
                  size: 80,
                  color: AppColor.btncolor,
                )),
                Text(
                  "Login to Active eEcommerce",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: AppColor.btncolor),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.btncolor),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60,
                  child: TextFieldWidget(
                    textEditingController: _emailEditingController,
                    hintText: "Enter Your Email",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColor.btncolor),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 60,
                  child: TextFieldWidget(
                    textEditingController: _passwordEdithingController,
                    hintText: "Enter Your Password",
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: signIn,
                  style: ElevatedButton.styleFrom(
                      maximumSize: const Size(double.infinity, 50),
                      backgroundColor: AppColor.btncolor2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text("Login"),
                ),
                const SizedBox(height: 10),
                const Center(child: Text("or create a new account")),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const SignUpScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.btncolor,
                  ),
                  child: const Text("Sign up"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signIn() {
    _authController.signIn(
        context: context,
        email: _emailEditingController.text.trim(),
        password: _passwordEdithingController.text);
  }
}
