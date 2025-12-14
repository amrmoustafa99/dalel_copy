import 'package:dalel_project/core/functions/navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              customReplacementNavigator(context, "/signIn");
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text("Home view")),
    );
  }
}
