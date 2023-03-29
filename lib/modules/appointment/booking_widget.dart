import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../shared/componants/assets_manager.dart';
import '../../shared/componants/language_type.dart';

class BookingWidget extends StatefulWidget {
  BookingWidget({super.key, this.index});
  int? index;

  @override
  _BookingWidgetState createState() => _BookingWidgetState(index);
}

class _BookingWidgetState extends State<BookingWidget> {
  bool isShow = false;
  int? index;

  _BookingWidgetState(this.index);
  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return InkWell(
            onTap: () {
              setState(() {
                isShow = !isShow;
              });
            },
            child: Row(
              children: [
                SizedBox(
                  height: isShow ? 160.h : 85.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: isShow
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: HexColor('#8281F8'),
                                ))
                            : null,
                        padding: const EdgeInsets.all(3),
                        child: Container(
                          width: 14.w,
                          height: 14.h,
                          decoration: BoxDecoration(
                              color: isShow || index == 0
                                  ? HexColor('#8281F8')
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: HexColor('#8281F8'))),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      if (index != cubit.getChooseServices!.data!.length-1)
                        Expanded(
                          child: Container(
                            width: 1.w,
                            height: 54.h,
                            color: HexColor('#8281F8'),
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(width: 18.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0.h),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 3.h),
                          padding: EdgeInsets.only(
                              top: 13.h,
                              right: isRtl() ? 17.w : 18.w,
                              left: isRtl() ? 18.w : 17.w,
                              bottom: 17.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: isShow
                                  ? HexColor("#8281F8")
                                  : HexColor(
                                          index == 0 || index == 2 || index == 4
                                              ? '#EC8E6C'
                                              : "#8281F8")
                                      .withOpacity(.1)),
                          child: isShow
                              ? Container(
                                  padding: EdgeInsets.only(
                                      top: 13.h,
                                      left: isRtl() ? 18.w : 0,
                                      bottom: 8.h),
                                  child: FittedBox(
                                    child: Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                  Text(
                                                     cubit.getChooseServices!.data![index!].services!.name!.ar!,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 180.w,
                                                ),
                                                const Text(
                                                  '7:00 PM',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                )
                                              ],
                                            ),
                                            SizedBox(
                                              height: 11.h,
                                            ),
                                            Text(
                                               cubit.getChooseServices!.data![index!].services!.longDescription!.ar!,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 16.h,
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#FFC57B'),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: const Image(
                                                    image: AssetImage(
                                                        ImageAssets.barberName),
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#FFC57B'),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: const Image(
                                                    image: AssetImage(
                                                        ImageAssets.barberName),
                                                  ),
                                                ),
                                                Container(
                                                  height: 30.h,
                                                  width: 30.w,
                                                  decoration: BoxDecoration(
                                                    color: HexColor('#FFC57B'),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: const Image(
                                                    image: AssetImage(
                                                        ImageAssets.barberName),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 130.w,
                                                ),
                                                const Image(
                                                  image: AssetImage(
                                                      ImageAssets.clockIcon),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      child: FittedBox(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              cubit.getChooseServices!.data![index!].services!.name!.ar!,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 8.h,
                                            ),
                                            Text(
                                              '${ cubit.getChooseServices!.data![index!].services!.description!.ar}',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '7:00 PM',
                                      style: TextStyle(
                                          color: HexColor('#212121')
                                              .withOpacity(0.30)),
                                    ),
                                  ],
                                ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
