import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthIniatlState());

  String? firstName;
  String? lastName;
  String? emailAdderess;
  String? password;
  bool? termsAndCondiationValue = false;
  bool? passwordVisibility = true;
  GlobalKey<FormState> SignUpKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(AuthILoadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAdderess.toString(),
            password: password.toString(),
          );
      await credential.user!.sendEmailVerification();
      emit(AuthSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(AuthFailuerState(error: "The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        emit(
          AuthFailuerState(
            error: "The account already exists for that email.'",
          ),
        );
      } else if (e.code == "invalid-email") {
        print("erroooor\n");
        print(e.code.toString());
      }
    } catch (e) {
      emit(AuthFailuerState(error: e.toString()));
    }
  }

  Future<void> verfiyEamil() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updateTermsAndConditiona({required value}) {
    termsAndCondiationValue = value;
    emit(AuthTermsAndConditionState());
  }

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility!;

    emit(AuthChangeVisibilityState());
  }

  Future<void> sigInWithEmailAndPassword() async {
    try {
      emit(SigninLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdderess!,
        password: password!,
      );
      emit(SigninSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SigninFailureState(errMessage: 'No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(
          SigninFailureState(
            errMessage: 'Wrong password provided for that user.',
          ),
        );
      }
    } catch (e) {
      emit(SigninFailureState(errMessage: e.toString()));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAdderess!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errMessage: e.toString()));
    }
  }
}
