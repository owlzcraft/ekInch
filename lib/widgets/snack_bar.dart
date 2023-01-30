import 'package:flutter/material.dart';

void createSnackBar(String message, BuildContext context) {
  final snackBar =
      new SnackBar(content: new Text(message), backgroundColor: Color(0xFFFEBA0F));

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
