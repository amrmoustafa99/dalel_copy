import 'package:dalel_project/core/utils/colors_app.dart';
import 'package:dalel_project/core/utils/text_style_custom.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });
  final String text1, text2;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(text: text1, style: CustomTextStyles.poppins400style12),
              TextSpan(
                text: text2,
                style: CustomTextStyles.poppins400style12.copyWith(
                  color: ColorsApp.lightGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
