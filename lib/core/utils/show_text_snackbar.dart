import 'package:flutter/material.dart';
import 'package:smart_agro/core/constants/keys.dart';

void showTextSnackbar(String text) {
  scaffoldMessangerKey.currentState
    ?..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(text),
      ),
    );
}
