import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/auth/auth__screens/login_screen.dart';
import 'package:salon_app/modules/auth/auth_cubit/auth_cubit.dart';
import 'package:salon_app/shared/componants/app_constane.dart';
import 'package:salon_app/shared/componants/di.dart';
import 'package:salon_app/shared/componants/language_type.dart';
import 'package:salon_app/shared/local_data_source/locale_data_source.dart';
import 'package:salon_app/shared/remote_data_source/remote_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/cubut/home_layout_cubit.dart';
import 'layout/cubut/home_layout_states.dart';
import 'modules/chose_place/choose_place.dart';
import 'modules/onboarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await initAppModule();

  await AppPreferences.init();

  DioHelper();
  Widget widget;

  bool? onBoarding = AppPreferences.getData('onBoarding');
  await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: HexColor('#FFFFFF').withOpacity(0.1),
  ));

  token = await AppPreferences.getData('token');
  print(token);

  if (onBoarding != null) {
    if (token != null) {
      widget = const ChosePlace();
    } else {
      widget = const LoginScreen();
    }
  } else {
    widget = const OnBoardingScreen();
  }

  runApp(EasyLocalization(
    child: Phoenix(
        child: MyApp(
      startWidget: widget,
    )),
    saveLocale: true,
    supportedLocales: const [arabicLocal, englishLocal],
    path: assetPathLocation,
    fallbackLocale: const Locale("ar", "SA"),
  ));
}

class MyApp extends StatefulWidget {
 final Widget startWidget;
 const MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState(startWidget);
}

class _MyAppState extends State<MyApp> {
  Widget startWidget;

  _MyAppState(this.startWidget);

  final AppPreferences _appPreferences = instance<AppPreferences>();
  @override
  void didChangeDependencies() {
    _appPreferences.getLocal().then((local) => {context.setLocale(local)});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (BuildContext context, Widget? child) {
      return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (BuildContext contextApp) => HomeLayoutCubit()
                  ..getBarberData()
                  ),
            BlocProvider(
              create: (BuildContext contextApp) => AuthCubit(),
            )
          ],
          child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
              listener: (context, state) {},
              builder: (context, state) {
                return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  debugShowCheckedModeBanner: false,
                  home:startWidget,
                  theme: ThemeData(
                      platform: TargetPlatform.iOS, fontFamily: 'Cairo'),
                );
              }));
    });
  }
}
