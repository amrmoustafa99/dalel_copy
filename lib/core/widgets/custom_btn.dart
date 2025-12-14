import 'package:flutter/material.dart';

import '../utils/colors_app.dart';
import '../utils/text_style_custom.dart';

class CustomBtn extends StatelessWidget {
  const CustomBtn({super.key, this.color, required this.text, this.onPressed});
  final Color? color;
  final String text;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? ColorsApp.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: CustomTextStyles.poppins500style24.copyWith(
            fontSize: 18,
            color: ColorsApp.offWhite,
          ),
        ),
      ),
    );
  }
}
