import 'package:ecommerce_android_app/constant/app_color.dart';
import 'package:ecommerce_android_app/constant/style.dart';
import 'package:ecommerce_android_app/ui/auth/controller/auth_controller.dart';
import 'package:ecommerce_android_app/ui/auth/screen/login_screen.dart';
import 'package:ecommerce_android_app/ui/widget/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameETController = TextEditingController();
  final TextEditingController _emailETController = TextEditingController();
  final TextEditingController _passwordETController = TextEditingController();
  final TextEditingController _reTypePasswordETController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final AuthController _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: Form(
            key: _formKey,
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
                Center(
                    child:
                        Text("Join Active eCommerce", style: bigTextStyle())),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Name",
                  style: smallTextStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                  textEditingController: _nameETController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Email",
                  style: smallTextStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                  textEditingController: _emailETController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Password",
                  style: smallTextStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                  textEditingController: _passwordETController,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Retype Password",
                  style: smallTextStyle(),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFieldWidget(
                  textEditingController: _reTypePasswordETController,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.btncolor,
                  ),
                  child: const Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 15),
                const Center(
                    child: Text(
                  "Already Have an Account?",
                )),
                const SizedBox(height: 3),
                ElevatedButton(
                  onPressed: () {
                    Get.offAll(() => const LoginScreen());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.btncolor2,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void signUp() {
    _authController.signUp(
        context: context,
        username: _nameETController.text.trim(),
        email: _emailETController.text.trim(),
        password: _passwordETController.text.trim());

    _nameETController.clear();
    _emailETController.clear();
    _passwordETController.clear();
    _reTypePasswordETController.clear();
  }

  @override
  void dispose() {
    _nameETController.dispose();
    _emailETController.dispose();
    _passwordETController.dispose();
    _reTypePasswordETController.dispose();
    super.dispose();
  }
}
