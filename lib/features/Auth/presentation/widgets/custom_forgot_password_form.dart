import 'package:dalel_project/core/functions/custom_toast_message.dart';
import 'package:dalel_project/core/functions/navigator.dart';
import 'package:dalel_project/core/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/strings_app.dart';
import '../../../../core/widgets/custom_btn.dart';
import '../signup_cubit/auth_cubit.dart';
import '../signup_cubit/auth_state.dart';
import 'custom_text_field.dart';

class CustomForgotPasswrodForm extends StatelessWidget {
  const CustomForgotPasswrodForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          customToastMessage(
            context: context,
            msg: 'Check Your Email To Reset Your Password',
          );
          customReplacementNavigator(context, "/signIn");
        } else if (state is ResetPasswordFailureState) {
          customToastMessage(context: context, msg: state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key: authCubit.forgotPasswordFormKey,
            child: Column(
              children: [
                CustomTextFormField(
                  labelText: AppStrings.emailAddress,
                  onChanged: (email) {
                    authCubit.emailAdderess = email;
                  },
                ),
                const SizedBox(height: 129),
                state is ResetPasswordLoadingState
                    ? CircularProgressIndicator(color: ColorsApp.primaryColor)
                    : CustomBtn(
                        onPressed: () async {
                          if (authCubit.forgotPasswordFormKey.currentState!
                              .validate()) {
                            await authCubit.resetPasswordWithLink();
                          }
                        },
                        text: AppStrings.sendResetPasswordLink,
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
