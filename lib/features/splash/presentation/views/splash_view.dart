import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../core/database/cache_helper.dart';
import '../../../../core/functions/daley_navigate.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/strings_app.dart';
import '../../../../core/utils/text_style_custom.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool onboardingvisited =
        getIt<CacheHelper>().getData(key: "OnboardingVisited") ?? false;

    if (onboardingvisited == true) {
      if (FirebaseAuth.instance.currentUser == null) {
        delayNavigate(context: context, path: "signIn");
      } else if (FirebaseAuth.instance.currentUser!.emailVerified == true) {
        delayNavigate(context: context, path: "home");
      } else {
        delayNavigate(context: context, path: "signIn");
      }
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        delayNavigate(context: context, path: "onBoarding");
      });
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.appName,
          style: CustomTextStyles.pacifico400style64,
        ),
      ),
    );
  }
}
