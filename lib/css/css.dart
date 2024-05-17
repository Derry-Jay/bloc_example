import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/values.dart';

class Css {
  static final Css _singleton = Css._internal();

  factory Css() {
    return _singleton;
  }

  Css._internal();

  final cupertinoFieldPlaceHolderStyleDefault =
          const TextStyle(color: CupertinoColors.placeholderText),
      theme = ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: shades.kBlue,
      );
}
