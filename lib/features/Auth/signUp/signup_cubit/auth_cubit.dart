import 'package:dalel_project/features/Auth/signUp/signup_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  createUserWithEmailAndPassword() async {
    try {
      emit(AuthILoadingState());
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAdderess.toString(),
            password: password.toString(),
          );
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
      }
    } catch (e) {
      emit(AuthFailuerState(error: e.toString()));
    }
  }

  void updateTermsAndConditiona({required value}) {
    termsAndCondiationValue = value;
    emit(AuthTermsAndConditionState());
  }

  void togglePasswordVisibility() {
    passwordVisibility = !passwordVisibility!;

    emit(AuthChangeVisibilityState());
  }

  sigInWithEmailAndPassword() async {
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
}
