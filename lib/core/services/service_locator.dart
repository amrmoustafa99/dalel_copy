// This is our global ServiceLocator
import 'package:get_it/get_it.dart';

import '../../features/Auth/presentation/signup_cubit/auth_cubit.dart';
import '../database/cache_helper.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
  getIt.registerSingleton<AuthCubit>(AuthCubit());
}
