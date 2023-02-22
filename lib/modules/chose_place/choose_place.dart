import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../../shared/componants/componants.dart';

class ChosePlace extends StatelessWidget {
  const ChosePlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> model = [
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
      ImageAssets.placeImage,
    ];
    return Scaffold(
        body: background(child: Column(children: [
                Padding(
                  padding: EdgeInsets.only(top: 76.h),
                  child: const Text(
                    'اختر محل الحلاقة',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        ),
                  ),
                ),
                SizedBox(
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                      child: GridView.count(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 30,
                          children: List.generate(
                              model.length,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Image(
                                                image: AssetImage(model[index]),
                                                fit: BoxFit.cover)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text('اسم المحل'),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ))),
                    )),
              ])));
  }
}
