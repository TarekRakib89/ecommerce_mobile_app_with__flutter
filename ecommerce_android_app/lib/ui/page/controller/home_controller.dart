import 'dart:convert';

import 'package:ecommerce_android_app/constant/global_variables.dart';

import 'package:ecommerce_android_app/ui/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Product>? _product = [];
  List<Product> get product => _product!;
  Future<void> getProductData() async {
    try {
      _product = [];

      http.Response response = await http.get(
        Uri.parse("$uri/api/products"),
      );

      for (int i = 0; i < jsonDecode(response.body).length; i++) {
        _product?.add(
          Product.fromJson(
            jsonDecode(response.body)[i],
          ),
        );
      }

      update();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
