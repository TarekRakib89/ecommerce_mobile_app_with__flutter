// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_android_app/constant/app_color.dart';

import 'package:ecommerce_android_app/ui/models/product.dart';

import 'package:ecommerce_android_app/ui/page/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    Key? key,
    required this.productItem,
  }) : super(key: key);
  final Product productItem;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int indexNumber = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: GestureDetector(
            onTap: () {
              Get.to(() => const MainScreen());
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              size: 30,
            )),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.share,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 200,
                  width: 50,
                  child: ListView.builder(
                      itemCount: widget.productItem.imageUrl?.length,
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            onTap: () {
                              indexNumber = index;
                              setState(() {});
                            },
                            child: Image.network(
                              widget.productItem.imageUrl![index],
                              height: 50,
                              width: 50,
                            ),
                          ),
                        );
                      }),
                ),
                Image.network(
                  widget.productItem.imageUrl![indexNumber],
                  height: 200,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          const Wrap(children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "iPhone 12 pro Pacific Blue 256 GB metal body with glass finish (shipped without charger)",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
          ]),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.btncolor2,
                      shape: const LinearBorder()),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.btncolor,
                      shape: const LinearBorder()),
                  child: const Text("Add to Cart"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
