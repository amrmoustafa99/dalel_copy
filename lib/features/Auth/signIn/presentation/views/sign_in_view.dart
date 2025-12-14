import 'package:dalel_project/core/functions/navigator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/strings_app.dart';
import '../../../signUp/presentation/widgets/custom_signin_form.dart';
import '../../../signUp/presentation/widgets/have_an_account_widget.dart';
import '../../../signUp/presentation/widgets/welcome_banner.dart';
import '../../../signUp/presentation/widgets/welcome_text_widget.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              customNavigator(context, "/signUp");
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: WelcomeBanner()),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
          const SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.welcomeBack),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomSignInForm(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
          SliverToBoxAdapter(
            child: HaveAnAccountWidget(
              text1: AppStrings.dontHaveAnAccount,
              text2: AppStrings.signUp,
              onTap: () {
                customReplacementNavigator(context, "/signUp");
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 16)),
        ],
      ),
    );
  }
}
