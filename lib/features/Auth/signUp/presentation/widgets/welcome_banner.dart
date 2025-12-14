import 'package:dalel_project/core/utils/colors_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/strings_app.dart';
import '../../../../../core/utils/text_style_custom.dart';
import '../../../../../generated/assets.dart';

class WelcomeBanner extends StatelessWidget {
  const WelcomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      decoration: BoxDecoration(color: ColorsApp.primaryColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(AppStrings.appName, style: CustomTextStyles.poppins600style28),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SvgPicture.asset(Assets.imagesVector2),
              SvgPicture.asset(Assets.imagesVector1),
            ],
          ),
        ],
      ),
    );
  }
}
