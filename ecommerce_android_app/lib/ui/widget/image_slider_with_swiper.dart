import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce_android_app/product_list.dart';

import 'package:flutter/material.dart';

class ImageSliderWithSwiper extends StatelessWidget {
  const ImageSliderWithSwiper({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.17,
      child: SizedBox(
        height: size.height * 0.1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: size.width,
              height: size.height * 0.01,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product[index]['image'],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          // autoplay: true,
          itemCount: product.length,
          pagination: const SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  color: Colors.white, activeColor: Colors.red)),
        ),
      ),
    );
  }
}
