import 'package:dalel_project/core/functions/custom_toast_message.dart';
import 'package:dalel_project/core/functions/navigator.dart';
import 'package:dalel_project/core/utils/colors_app.dart';
import 'package:dalel_project/core/utils/strings_app.dart';
import 'package:dalel_project/core/widgets/custom_btn.dart';
import 'package:dalel_project/features/Auth/signUp/presentation/widgets/terms_and_condition_widget.dart';
import 'package:dalel_project/features/Auth/signUp/signup_cubit/auth_cubit.dart';
import 'package:dalel_project/features/Auth/signUp/signup_cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_text_field.dart';

class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessState) {
          customToastMessage(context: context, msg: "Created Account success");
          customReplacementNavigator(context, "/home");
        } else if (state is AuthFailuerState) {
          customToastMessage(context: context, msg: state.error);
        }
      },
      builder: (context, state) {
        var cubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key: cubit.SignUpKey,
          child: Column(
            children: [
              CustomTextFormField(
                labelText: AppStrings.fristName,
                onChanged: (firstName) {
                  cubit.firstName = firstName;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.lastName,
                onChanged: (lastNme) {
                  cubit.lastName = lastNme;
                },
              ),
              CustomTextFormField(
                labelText: AppStrings.emailAddress,
                onChanged: (emailAddress) {
                  cubit.emailAdderess = emailAddress;
                },
              ),
              CustomTextFormField(
                obscureText: cubit.passwordVisibility,
                labelText: AppStrings.password,
                onChanged: (password) {
                  cubit.password = password;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    cubit.passwordVisibility!
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    cubit.togglePasswordVisibility();
                  },
                ),
              ),
              const TermsAndConditionWidget(),
              const SizedBox(height: 88),
              state is AuthILoadingState
                  ? CircularProgressIndicator()
                  : CustomBtn(
                      color: cubit.termsAndCondiationValue == false
                          ? ColorsApp.grey
                          : null,
                      onPressed: () async {
                        if (cubit.termsAndCondiationValue == true) {
                          if (cubit.SignUpKey.currentState!.validate()) {
                            cubit.createUserWithEmailAndPassword();
                          }
                        }
                      },
                      text: AppStrings.signUp,
                    ),
            ],
          ),
        );
      },
    );
  }
}
