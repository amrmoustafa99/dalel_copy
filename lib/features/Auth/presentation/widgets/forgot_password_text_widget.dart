import 'package:dalel_project/core/functions/navigator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings_app.dart';
import '../../../../../core/utils/text_style_custom.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        customReplacementNavigator(context, "/forgotPassword");
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          AppStrings.forgotPassword,
          style: CustomTextStyles.poppins600style28.copyWith(fontSize: 12),
        ),
      ),
    );
  }
}
