import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'modules/onboarding/onboarding_screen.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark,statusBarColor: Colors.white));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return  const MaterialApp(

          debugShowCheckedModeBanner: false,
          home: OnBoardingScreen(),
        );
      },
    );
  }
}
