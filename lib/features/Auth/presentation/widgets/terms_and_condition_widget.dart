import 'package:dalel_project/core/utils/strings_app.dart';
import 'package:dalel_project/core/utils/text_style_custom.dart';
import 'package:flutter/material.dart';

import 'custom_check_box.dart';

class TermsAndConditionWidget extends StatelessWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CustomCheckBox(),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppStrings.iHaveAgreeToOur,
                style: CustomTextStyles.poppins400style12,
              ),
              TextSpan(
                text: AppStrings.termsAndCondition,
                style: CustomTextStyles.poppins400style12.copyWith(
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
