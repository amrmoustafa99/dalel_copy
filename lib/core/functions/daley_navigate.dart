import 'navigator.dart';

void delayNavigate({context, required path}) {
  Future.delayed(const Duration(seconds: 3), () {
    customReplacementNavigator(context, '/$path');
  });
}
