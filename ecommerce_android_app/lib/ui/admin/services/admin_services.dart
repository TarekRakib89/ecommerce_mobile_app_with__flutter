import 'dart:convert';
import 'dart:io';

import 'package:ecommerce_android_app/constant/error_handling.dart';
import 'package:ecommerce_android_app/constant/global_variables.dart';
import 'package:ecommerce_android_app/constant/utils.dart';
import 'package:ecommerce_android_app/ui/models/product.dart';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddminServices {
  void addProduct({
    required BuildContext context,
    required String name,
    required String title,
    required String description,
    required String price,
    required String category,
    required List<File> images,
  }) async {
    debugPrint("plz print Name $name");
    try {
      final cloudinary =
          CloudinaryPublic('dtziinygi', 'juzvcidh', cache: false);
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        imageUrls.add(res.secureUrl);
      }
      List<Sizes> size = [
        Sizes(size: "9", isSelected: false),
        Sizes(size: "5", isSelected: false),
        Sizes(size: "4", isSelected: false),
      ];
      Product product = Product(
        name: name,
        title: title,
        category: category,
        imageUrl: imageUrls,
        oldPrice: "5000",
        sizes: size,
        price: price,
        description: description,
      );

      http.Response response = await http.post(
        Uri.parse("$uri/api/products"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );

      if (context.mounted) {
        httpErrorHandle(
          response: response,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Added Successfully!");
          },
        );
      }
    } catch (e) {
      if (context.mounted) {
        showSnackBar(context, e.toString());
      }
    }
  }
}
