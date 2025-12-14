import 'package:flutter/material.dart';

import '../../../../core/database/cache_helper.dart';
import '../../../../core/functions/navigator.dart';
import '../../../../core/services/service_locator.dart';
import '../../data/on_boarding_data.dart';
import '../widgets/get_buttons.dart';
import '../widgets/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController boardController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = OnBoardingData.items;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  getIt<CacheHelper>().saveData(
                    key: "OnboardingVisited",
                    value: true,
                  );
                  customReplacementNavigator(context, "/signUp");
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 650,
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                controller: boardController,
                itemCount: items.length,
                itemBuilder: (context, index) => OnBoardingItem(
                  model: items[index],
                  controller: boardController,
                  count: items.length,
                ),
              ),
            ),

            const SizedBox(height: 40),
            GetButtons(currentIndex: currentIndex, controller: boardController),
            const SizedBox(height: 17),
          ],
        ),
      ),
    );
  }
}
