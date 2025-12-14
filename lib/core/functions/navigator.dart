import 'package:go_router/go_router.dart';

void customNavigator(context, String path) {
  GoRouter.of(context).push(path);
}

void customReplacementNavigator(context, String path) {
  GoRouter.of(context).pushReplacement(path);
}
