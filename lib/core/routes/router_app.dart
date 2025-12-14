import 'package:dalel_project/core/services/service_locator.dart';
import 'package:dalel_project/features/Auth/signIn/presentation/views/sign_in_view.dart';
import 'package:dalel_project/features/Auth/signUp/signup_cubit/auth_cubit.dart';
import 'package:dalel_project/features/Home/presentation/views/home_view.dart';
import 'package:dalel_project/features/onBoarding/presenation/views/on_boarding_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/Auth/signUp/presentation/views/sign_up_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => SplashView()),

    GoRoute(
      path: "/onBoarding",
      builder: (context, state) => OnBoardingScreen(),
    ),

    GoRoute(
      path: "/signUp",
      builder: (context, state) => BlocProvider(
        create: (context) => getIt<AuthCubit>(),
        child: SignUpView(),
      ),
    ),

    GoRoute(
      path: "/signIn",
      builder: (context, state) =>
          BlocProvider(create: (context) => AuthCubit(), child: SignInView()),
    ),

    GoRoute(
      path: "/home",
      builder: (context, state) =>
          BlocProvider(create: (context) => AuthCubit(), child: HomeView()),
    ),
  ],
);
