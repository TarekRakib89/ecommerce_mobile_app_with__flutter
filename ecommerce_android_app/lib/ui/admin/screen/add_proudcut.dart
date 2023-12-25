import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_android_app/constant/app_color.dart';
import 'package:ecommerce_android_app/constant/style.dart';
import 'package:ecommerce_android_app/constant/utils.dart';
import 'package:ecommerce_android_app/ui/admin/services/admin_services.dart';
import 'package:ecommerce_android_app/ui/widget/text_field_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _productNEController = TextEditingController();
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _priceTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final AddminServices _addminServices = AddminServices();

  String category = "Mobiles";
  List<File> images = [];
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _productNEController.dispose();
    _titleTEController.dispose();
    _priceTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }

  List<String> productCategories = [
    "Mobiles",
    "Essentials",
    "Appliances",
    "Books",
    "Fashion"
  ];

  void selectImages() async {
    var res = await pickImages();
    images = res;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Product Add",
                    style: bigTextStyle(),
                  ),
                  const SizedBox(height: 30),
                  images.isNotEmpty
                      ? CarouselSlider(
                          items: images.map(
                            (i) {
                              return Builder(
                                builder: (BuildContext context) => Image.file(
                                  i,
                                  fit: BoxFit.cover,
                                  height: 200,
                                ),
                              );
                            },
                          ).toList(),
                          options:
                              CarouselOptions(viewportFraction: 1, height: 200),
                        )
                      : GestureDetector(
                          onTap: selectImages,
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(10),
                            dashPattern: const [10, 4],
                            strokeCap: StrokeCap.round,
                            child: Container(
                              width: double.infinity,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.folder_open,
                                    size: 40,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Select Product Iamges",
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.grey.shade400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    textEditingController: _productNEController,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    textEditingController: _titleTEController,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    textEditingController: _priceTEController,
                  ),
                  const SizedBox(height: 10),
                  TextFieldWidget(
                    textEditingController: _descriptionTEController,
                    maxLine: 5,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      value: category,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: productCategories.map((item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? newVal) {
                        category = newVal!;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                      onPressed: addProduct,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.btncolor),
                      child: const Text(
                        "Add Product",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addProduct() {
    _addminServices.addProduct(
      context: context,
      name: _productNEController.text,
      title: _titleTEController.text,
      description: _descriptionTEController.text,
      price: _priceTEController.text.trim(),
      category: category,
      images: images,
    );
  }
}
