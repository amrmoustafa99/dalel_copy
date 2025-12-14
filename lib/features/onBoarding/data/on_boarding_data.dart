// on_boarding_data.dart
import '../../../../core/utils/assets_app.dart';
import '../../../../core/utils/strings_app.dart';
import 'on_borading_model.dart';

class OnBoardingData {
  static final List<OnBoradingModel> items = [
    OnBoradingModel(
      image: AssetsApp.onBoardingOneImage,
      title: AppStrings.onBoardingTitle1,
      titleBody: AppStrings.onBoardingBody1,
    ),
    OnBoradingModel(
      image: AssetsApp.onBoardingTwoImage,
      title: AppStrings.onBoardingTitle2,
      titleBody: AppStrings.onBoardingBody2,
    ),
    OnBoradingModel(
      image: AssetsApp.onBoardingThreeImage,
      title: AppStrings.onBoardingTitle3,
      titleBody: AppStrings.onBoardingBody3,
    ),
  ];
}
