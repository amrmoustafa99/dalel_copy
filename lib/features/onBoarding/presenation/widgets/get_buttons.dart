import 'package:flutter/material.dart';

import '../../../../core/functions/navigator.dart';
import '../../../../core/utils/strings_app.dart';
import '../../../../core/utils/text_style_custom.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../../data/on_boarding_data.dart';

class GetButtons extends StatelessWidget {
  const GetButtons({
    super.key,
    required this.currentIndex,
    required this.controller,
  });
  final int currentIndex;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    if (currentIndex == OnBoardingData.items.length - 1) {
      return Column(
        children: [
          CustomBtn(
            text: AppStrings.createAccount,
            onPressed: () {
              customNavigator(context, "/signUp");
            },
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {},
            child: Text(
              AppStrings.loginNow,
              style: CustomTextStyles.poppins300style16.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      );
    } else {
      return CustomBtn(
        text: AppStrings.next,
        onPressed: () {
          controller.nextPage(
            duration: Duration(milliseconds: 750),
            curve: Curves.fastLinearToSlowEaseIn,
          );
        },
      );
    }
  }
}
