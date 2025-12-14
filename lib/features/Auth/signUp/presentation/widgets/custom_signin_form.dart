import 'package:dalel_project/core/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/custom_toast_message.dart';
import '../../../../../core/functions/navigator.dart';
import '../../../../../core/utils/strings_app.dart';
import '../../../../../core/widgets/custom_btn.dart';
import '../../signup_cubit/auth_cubit.dart';
import '../../signup_cubit/auth_state.dart';
import 'custom_text_field.dart';

class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SigninSuccessState) {
          customToastMessage(context: context, msg: "Welcome backe");
          customReplacementNavigator(context, "/home");
        } else if (state is SigninFailureState) {
          customToastMessage(context: context, msg: state.errMessage);
        }
      },
      builder: (context, state) {
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: authCubit.signinFormKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (email) {
                  authCubit.emailAdderess = email;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.passwordVisibility == true
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    authCubit.togglePasswordVisibility();
                  },
                ),
                obscureText: authCubit.passwordVisibility,
                onChanged: (password) {
                  authCubit.password = password;
                },
              ),
              const SizedBox(height: 16),
              // const ForgotPasswordTextWidget(),
              const SizedBox(height: 102),
              state is SigninLoadingState
                  ? CircularProgressIndicator(color: ColorsApp.primaryColor)
                  : CustomBtn(
                      onPressed: () {
                        if (authCubit.signinFormKey.currentState!.validate()) {
                          authCubit.sigInWithEmailAndPassword();
                        }
                      },
                      text: AppStrings.signIn,
                    ),
            ],
          ),
        );
      },
    );
  }
}
