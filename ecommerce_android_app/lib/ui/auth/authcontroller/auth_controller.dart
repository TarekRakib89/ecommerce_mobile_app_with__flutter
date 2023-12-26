// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_android_app/constant/error_handling.dart';
import 'package:ecommerce_android_app/constant/global_variables.dart';
import 'package:ecommerce_android_app/constant/utils.dart';
import 'package:ecommerce_android_app/ui/auth/auth_network_caller/auth_network_caller.dart';
import 'package:ecommerce_android_app/ui/models/user.dart';
import 'package:ecommerce_android_app/ui/page/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final NetworkCaller _networkCaller;
  AuthController(
    this._networkCaller,
  );

  String? _token;
  User? _userData;

  String get token => _token!;
  User get userData => _userData!;

  void signUp({
    required BuildContext context,
    required String username,
    required String email,
    required String password,
  }) async {
    User user = User(
        id: "",
        username: username,
        email: email,
        password: password,
        address: "",
        type: "",
        token: "");

    http.Response res = await _networkCaller.postRequestRegistartion(user);
    if (context.mounted) {
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'Account created! Login with same credentials!');
          });
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      http.Response res = await _networkCaller.postRequestLogin(
        body: {
          "email": email,
          "password": password,
        },
      );
      if (context.mounted) {
        httpErrorHandle(
            response: res,
            context: context,
            onSuccess: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();

              await prefs.setString(
                  'x-auth-token', jsonDecode(res.body)['token']);
              _userData = User.fromJson(res.body);
              update();
              Get.offAll(() => const MainScreen());
              if (context.mounted) {
                showSnackBar(context, 'Login Successful');
              }
            });
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }

  void getUserData({
    required BuildContext context,
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('x-auth-token');

      debugPrint("print Token $token");

      http.Response res = await http.get(
        Uri.parse("$uri/api/users"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token
        },
      );

      _userData = User.fromJson(res.body);

      update();
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }
}
