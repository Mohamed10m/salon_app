import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/componants.dart';
import 'package:salon_app/shared/componants/fonts_manager.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/componants/app_strings.dart';
import '../../shared/componants/assets_manager.dart';
import '../auth/auth__screens/login_screen.dart';
import 'onboarding_widget.dart';

class BoardingModel {
  final Container container;
  final String title;
  final String subTitle;


  BoardingModel({
    required this.container,
    required this.title,
    required this.subTitle,


  });
}

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController boardController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.background),
                    fit: BoxFit.cover)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, left: 35),
                  child: SizedBox(
                    height: 35.h,
                    width: 67.w,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: HexColor('#8281F8'), width: 1),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)))),
                        onPressed: () {
                        navigateAndFinish(context, const LoginScreen());
                        },
                        child: Center(
                          child: Text(
                            AppStrings.skip,
                            style: TextStyle(

                                color: HexColor('#8281F8'),
                                fontWeight: FontWeightManager.medium,
                                fontFamily: FontConstants.poppinsFontFamily,
                                fontSize: 16),
                          ),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: PageView.builder(
                        itemBuilder: (context, index) =>
                            buildBoardingItem(boarding[index]),
                        itemCount: boarding.length,
                        controller: boardController,
                        onPageChanged: (int index) {
                          if (index == boarding.length - 1) {
                            setState(() {
                              isLast = true;
                            });
                          } else {
                            setState(() {
                              isLast = false;
                            });
                          }
                        },
                      )),
                ),
                Center(
                  child: FloatingActionButton(
                    backgroundColor: HexColor('#FCC885'),
                    onPressed: () {
                      if (isLast) {
                        navigateAndFinish(context, const LoginScreen());

                      } else {
                        boardController.nextPage(
                            duration: const Duration(
                              milliseconds: 900,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn);
                      }
                    },
                    child: const Icon(Icons.arrow_back),
                  ),
                ),
                SizedBox(
                  height: 57.h,
                ),
              ],
            )),
        Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Align(
              alignment: Alignment.center,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SmoothPageIndicator(
                    controller: boardController,
                    effect: ExpandingDotsEffect(
                        dotColor: HexColor('#D9D9D9'),
                        activeDotColor: HexColor('#FCC885'),
                        dotHeight: 8,
                        expansionFactor: 4,
                        dotWidth: 8,
                        spacing: 5.0),
                    count: boarding.length),
              )),
        ),
      ],
    ));
  }
}
