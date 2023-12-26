import 'dart:convert';

import 'package:ecommerce_android_app/constant/global_variables.dart';
import 'package:ecommerce_android_app/ui/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeRepository {
  Future<List<Product>> getProductData() async {
    try {
      List<Product>? product = [];

      http.Response response = await http.get(
        Uri.parse("$uri/api/products"),
      );

      for (int i = 0; i < jsonDecode(response.body).length; i++) {
        product.add(
          Product.fromJson(
            jsonDecode(response.body)[i],
          ),
        );
      }

      return product;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
