import 'package:flutter/material.dart';

import '../../../../core/utils/strings_app.dart';
import '../widgets/custom_forgot_password_form.dart';
import '../widgets/forgot_password_image.dart';
import '../widgets/forgot_password_sub_title.dart';
import '../widgets/welcome_text_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 108)),
          SliverToBoxAdapter(
            child: WelcomeTextWidget(text: AppStrings.forgotPassword),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40)),
          SliverToBoxAdapter(child: ForgotPasswrodImage()),
          SliverToBoxAdapter(child: SizedBox(height: 24)),
          SliverToBoxAdapter(child: ForgotPasswordSubTitle()),
          SliverToBoxAdapter(child: CustomForgotPasswrodForm()),
        ],
      ),
    );
  }
}
