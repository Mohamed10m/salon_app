import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../../layout/home_layout/home_layout.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

class ChosePlace extends StatefulWidget {
  const ChosePlace({Key? key}) : super(key: key);

  @override
  State<ChosePlace> createState() => _ChosePlaceState();
}

class _ChosePlaceState extends State<ChosePlace> {
  List<String> model = [
    ImageAssets.placeImage,
    ImageAssets.placeImage2,
    ImageAssets.placeImage3,
    ImageAssets.placeImage4,
    ImageAssets.placeImage,
    ImageAssets.placeImage2,
    ImageAssets.placeImage3,
    ImageAssets.placeImage3,
    ImageAssets.placeImage,
    ImageAssets.placeImage2,
    ImageAssets.placeImage3,
    ImageAssets.placeImage4,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(ImageAssets.background), fit: BoxFit.cover)),
      child: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 64.h),
            child: const Text(
              'اختر محل الحلاقة',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 20,
                childAspectRatio: 1 / 1.70,
                children: List.generate(
                  model.length,
                  (index) => InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image:  DecorationImage(
                                  image: AssetImage(model[index]),
                                  fit: BoxFit.cover)),
                          height: 224.h,
                          width: 151.w,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'اسم محل الحلاقه',
                              style: TextStyle(
                                fontWeight: FontWeightManager.medium,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            )),
                      ],
                    ),
                    onTap: () {
                      navigateTo(context, const HomeLayout());
                    },
                  ),
                )),
          ),
        ]),
      ),
    ));
  }
}
