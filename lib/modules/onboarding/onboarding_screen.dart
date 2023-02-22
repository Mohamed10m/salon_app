import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/componants/app_strings.dart';
import '../../shared/componants/color_manager.dart';
import '../auth/auth__screens/login_screen.dart';
import 'onboarding_widget.dart';

class BoardingModel {
  final Container container;
  final String title;
  final String subTitle1;
  final String subTitle2;
  final String subTitle3;

  BoardingModel({
    required this.container,
    required this.title,
    required this.subTitle1,
    required this.subTitle2,
    required this.subTitle3,
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
      backgroundColor: ColorManager.scaffoldBackgroundColor,

      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0, right: 35),
                child: SizedBox(
                  height: 35.h,
                  width: 67.w,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          primary: Colors.red,
                          side:
                          BorderSide(color: HexColor('#8281F8'), width: 1),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(16)))),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                                (route) {
                              return false;
                            });
                      },
                      child: Text(
                        AppStrings.skip,
                        style: TextStyle(
                            color: HexColor('#8281F8'),
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Expanded(
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
                ),
              ),
              Center(
                child: FloatingActionButton(
                  backgroundColor: HexColor('#FCC885'),
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                          context, MaterialPageRoute(builder: (context) => const LoginScreen()),
                              (route) {
                            return false;
                          });
                    } else {
                      boardController.nextPage(
                          duration: const Duration(
                            milliseconds: 900,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ),
              SizedBox(
                height: 57.h,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Align(
              alignment: Alignment.center,
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
            ),
          ),
        ],
      ),
    );
  }

}