import 'dart:async';
import 'dart:io';

import 'package:bloc_example/blocs/counter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_phone_number/get_phone_number.dart';
import 'package:global_configs/global_configs.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../css/css.dart';
import '../css/measurements.dart';
import '../css/shades.dart';
import '../extensions/extensions.dart';
import '../models/common/app_config.dart';
import '../models/common/progress.dart';
import 'enums.dart';
import 'methods.dart';
import 'my_geocoder.dart';
import 'my_geolocator.dart';
import 'my_local_authentication.dart';
import 'route_generator.dart';

int page = 0;

WidgetsBinding? wb;

GlobalConfigs? res;

bool hideText = true;

GlobalConfiguration? gc;

AppConfig acf = AppConfig();

DateTime? currentBackPressTime;

StreamSubscription<Progress>? ssc;

Map<String, dynamic> body = <String, dynamic>{};

const apiMode =
    kDebugMode ? APIMode.dev : (kProfileMode ? APIMode.test : APIMode.prod);

final css = Css(),
    st = Stopwatch(),
    shades = Shades(),
    gco = MyGeocoder(),
    gl = MyGeolocator(),
    conn = Connectivity(),
    gph = GetPhoneNumber(),
    picker = ImagePicker(),
    today = DateTime.now(),
    isIOS = Platform.isIOS,
    fmd1 = DateFormat.MMMd(),
    isMac = Platform.isMacOS,
    dip = DeviceInfoPlugin(),
    isLinux = Platform.isLinux,
    thisMoment = TimeOfDay.now(),
    sc = TextEditingController(),
    tc = TextEditingController(),
    isCupertino = isIOS || isMac,
    la = MyLocalAuthentication(),
    measurements = Measurements(),
    phc = TextEditingController(),
    pwc = TextEditingController(),
    sdc = TextEditingController(),
    edc = TextEditingController(),
    isAndroid = Platform.isAndroid,
    isWindows = Platform.isWindows,
    isFuchsia = Platform.isFuchsia,
    rg = RouteGenerator(flag: true),
    isPortable = isAndroid || isIOS,
    minDesignSize = const Size(400, 800),
    title = gc?.getValue<String>('name') ?? '',
    sharedPrefs = SharedPreferences.getInstance(),
    minPwdLth = gc?.getValue<String>('minimum_password_length').toInt() ?? 6,
    maxPwdLth = gc?.getValue<String>('maximum_password_length').toInt() ?? 12,
    splashScreenDelay =
        gc?.getValue<String>('splash_screen_delay').toInt() ?? 3,
    isWeb = !(isAndroid || isCupertino || isWindows || isLinux || isFuchsia) &&
        kIsWeb,
    pwdExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$'),
    mailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"),
    providers = const <SingleChildWidget>[
      BlocProvider<CounterBloc>(create: getCounter)
    ];
