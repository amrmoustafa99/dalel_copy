// This is our global ServiceLocator
import 'package:dalel_project/features/Auth/signUp/signup_cubit/auth_cubit.dart';
import 'package:get_it/get_it.dart';

import '../database/cache_helper.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
