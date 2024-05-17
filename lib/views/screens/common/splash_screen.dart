import 'dart:async';

import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../utils/values.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void setData(Duration time) async {
    await Future.delayed(
        <int>[2, 3].contains(time.inSeconds)
            ? time
            : Duration(seconds: splashScreenDelay),
        nextScreen);
  }

  FutureOr nextScreen() {
    return context.gotoForever('/sample');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wb?.addPostFrameCallback(setData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: title.textWidget());
  }
}
