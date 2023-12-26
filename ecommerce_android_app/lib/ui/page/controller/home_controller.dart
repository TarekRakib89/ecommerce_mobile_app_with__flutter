// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:ecommerce_android_app/constant/global_variables.dart';
import 'package:ecommerce_android_app/ui/models/product.dart';
import 'package:ecommerce_android_app/ui/page/repository/home_repository.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository);

  List<Product>? _product = [];

  List<Product> get product => _product!;
  Future<void> getProductData() async {
    _product = await _repository.getProductData();
    update();
  }
}
