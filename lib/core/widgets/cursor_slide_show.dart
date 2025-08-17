import 'package:ecommerce/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class CursorSlideShow extends StatelessWidget {
  const CursorSlideShow({super.key});

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        width: double.infinity,
        height: 200,
        initialPage: 0,
        indicatorColor: AppColors.primary,
        indicatorBackgroundColor: AppColors.gray,
        autoPlayInterval: 3000,
        isLoop: true,
        indicatorRadius: 5,
        children: [
          Image.asset("assets/CarouselSlider2.png"),
          Image.asset("assets/CarouselSlider1.png"),
          Image.asset("assets/CarouselSlider3.png")
        ]
    );
  }
}
