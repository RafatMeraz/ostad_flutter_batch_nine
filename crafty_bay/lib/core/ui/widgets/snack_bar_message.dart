import 'package:flutter/material.dart';

void showSnackBarMessage(
  BuildContext context,
  String title, [
  bool isError = false,
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: TextStyle(color: isError ? Colors.white : null),
      ),
      backgroundColor: isError ? Colors.red : null,
    ),
  );
}
