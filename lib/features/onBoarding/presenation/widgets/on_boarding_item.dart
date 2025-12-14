// on_boarding_item.dart
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/colors_app.dart';
import '../../data/on_borading_model.dart';

class OnBoardingItem extends StatelessWidget {
  final OnBoradingModel model;
  final PageController controller;
  final int count;

  const OnBoardingItem({
    super.key,
    required this.model,
    required this.controller,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage(model.image)),
          const SizedBox(height: 24),

          // Indicator
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 80),
            child: SmoothPageIndicator(
              controller: controller,
              count: count,
              effect: ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: ColorsApp.deepBrown,
              ),
            ),
          ),

          // Title
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),

          const SizedBox(height: 30),

          // Body
          Text(
            model.titleBody,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }
}
