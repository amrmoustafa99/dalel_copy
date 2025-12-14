import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/database/cache_helper.dart';
import 'core/routes/router_app.dart';
import 'core/services/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  await getIt<CacheHelper>().init();
  runApp(const Dalel());
}

//  M V VM
class Dalel extends StatelessWidget {
  const Dalel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Dalel",
      routerConfig: router,
    );
  }
}
