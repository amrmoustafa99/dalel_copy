import 'package:flutter/material.dart';

void customToastMessage({required context, required String msg}) {
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
}
