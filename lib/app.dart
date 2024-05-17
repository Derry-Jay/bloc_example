import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/keys.dart';
import 'utils/values.dart';
import 'views/screens/common/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget rootBuilder(BuildContext context, Widget? child) {
    ScreenUtil.init(context, minTextAdapt: true, designSize: minDesignSize);
    return MaterialApp(
        home: child,
        title: title,
        theme: css.theme,
        navigatorKey: navKey,
        onGenerateRoute: rg.generateRoute,
        debugShowCheckedModeBanner: kDebugMode);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: providers,
        child: ScreenUtilInit(
            minTextAdapt: true,
            builder: rootBuilder,
            designSize: minDesignSize,
            child: const SplashScreen()));
  }
}
