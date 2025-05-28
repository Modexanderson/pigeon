import 'package:flutter/material.dart';


final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();


void showSnackBar(String text, [Color? bgColor, Color? textColor]) {
  scaffoldMessengerKey.currentState?.removeCurrentSnackBar();
  scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
    behavior: SnackBarBehavior.fixed,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(color: textColor, fontSize: 24),
    ),
    backgroundColor: bgColor ?? Colors.green,
    shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  ));
}