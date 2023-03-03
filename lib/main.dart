import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import 'modules/onboarding/onboarding_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: HexColor('#FFFFFF').withOpacity(0.1),
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar'),
          home: const OnBoardingScreen(),
          builder: (_, Widget? child) =>
              Directionality(textDirection: TextDirection.rtl, child: child!),
          theme: ThemeData(platform: TargetPlatform.iOS, fontFamily: 'Cairo'),
        );
      },
    );
  }
}
