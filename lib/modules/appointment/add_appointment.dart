import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import '../../../shared/componants/componants.dart';
import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../shared/componants/app_strings.dart';
import '../../shared/componants/fonts_manager.dart';
import '../../shared/componants/language_type.dart';
import '../payment/payment_widget.dart';
import 'add_appointment_successfully.dart';

class AddAppointmentScreen extends StatefulWidget {
  AddAppointmentScreen({Key? key, this.id}) : super(key: key);
 final int? id;
  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState(id);
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  _AddAppointmentScreenState(this.id);
  int? id;

  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    return BlocProvider(create: (context)=>HomeLayoutCubit()..getShowDataUser(),
    child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>
      (
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context).showData;

          var formKey = GlobalKey<FormState>();

          TextEditingController dateController = TextEditingController();
          TextEditingController timeController = TextEditingController();
          TextEditingController nameController = TextEditingController();
          TextEditingController emailController = TextEditingController();
          TextEditingController phoneController = TextEditingController();

          if (cubit != null) {
            nameController.text = cubit.name!;
            emailController.text = cubit.email!;
            phoneController.text = cubit.phone!;
          }
          return ConditionalBuilder(condition: cubit!=null, builder: (context)=>Scaffold(
            body: background(
              child: Padding(
                padding: EdgeInsets.only(top: 62.h, right: 30.w, left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back)),
                        SizedBox(
                          width: 96.w,
                        ),
                        Text(
                          AppStrings.addAppointment.tr(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 44.h),
                    Text(
                      AppStrings.chooseDay.tr(),
                      style: const TextStyle(
                        fontWeight: FontWeightManager.semiBold,
                        fontFamily: FontConstants.cairoFontFamily,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor('#FFFFFF').withOpacity(0.40)),
                        width: 319.w,
                        height: 306.h,
                        child: Theme(
                          data: ThemeData(
                              colorScheme: ColorScheme(
                                  brightness: Brightness.light,
                                  primary: ColorManager.buttonColor,
                                  onPrimary: Colors.white,
                                  secondary: Colors.transparent,
                                  onSecondary: Colors.transparent,
                                  error: Colors.transparent,
                                  onError: Colors.transparent,
                                  background: Colors.transparent,
                                  onBackground: Colors.blue,
                                  surface: Colors.blue,
                                  onSurface: Colors.black)),
                          child: CalendarDatePicker(
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2090),
                            onDateChanged: (date) {},
                          ),
                        )),
                    SizedBox(
                      height: 32.h,
                    ),
                    Text(AppStrings.name.tr(),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeightManager.medium,
                          fontFamily: FontConstants.cairoFontFamily,
                        )),
                    SizedBox(
                      height: 24.h,
                    ),
                    Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customFormField(
                              valueKey: 'name',
                              text: AppStrings.name.tr(),
                              hintStyle: const TextStyle(color: Colors.black87),
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "name must not be empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: nameController,
                              type: TextInputType.emailAddress,
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(AppStrings.emailAddress.tr(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeightManager.medium,
                                  fontFamily: FontConstants.cairoFontFamily,
                                )),
                            SizedBox(
                              height: 24.h,
                            ),
                            customFormField(
                              valueKey: 'Email',
                              text: AppStrings.emilHintText.tr(),
                              hintStyle: const TextStyle(color: Colors.black),
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "email must not be empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: emailController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Text(
                              AppStrings.phoneText.tr(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeightManager.medium,
                                  fontFamily: FontConstants.cairoFontFamily),
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            customFormField(
                              valueKey: 'Phone',
                              text: "+05xxxxxxxx ",
                              hintStyle: const TextStyle(
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return "Phone must not be empty";
                                } else {
                                  return null;
                                }
                              },
                              controller: phoneController,
                              type: TextInputType.number,
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.dateText.tr(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      customFormField(
                                        valueKey: 'Password',
                                        fill: false,
                                        text: "2/5/2023",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Password must not be empty";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: dateController,
                                        type: TextInputType.name,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        AppStrings.time.tr(),
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      customFormField(
                                        valueKey: 'Password',
                                        fill: false,
                                        text: "568",
                                        hintStyle: const TextStyle(
                                            color: Colors.black),
                                        validate: (String? value) {
                                          if (value!.isEmpty) {
                                            return "Password must not be empty";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: timeController,
                                        type: TextInputType.name,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 24.h,
                            // ),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(AppStrings.chooseService.tr(),
                            //         style: const TextStyle(
                            //             fontSize: 16,
                            //             fontFamily:
                            //             FontConstants.cairoFontFamily,
                            //             fontWeight: FontWeight.w700)),
                            //     SizedBox(
                            //       height: 24.h,
                            //     ),
                            //     // Column(
                            //     //   children: [
                            //     //     FittedBox(
                            //     //       child: Row(
                            //     //         children: [
                            //     //           Container(
                            //     //             alignment: Alignment.center,
                            //     //             height: 40.h,
                            //     //             width: 90.w,
                            //     //             decoration: BoxDecoration(
                            //     //                 color: HexColor('#EC8E6C')
                            //     //                     .withOpacity(0.10),
                            //     //                 borderRadius:
                            //     //                 BorderRadius.circular(8)),
                            //     //             child: Text(
                            //     //               AppStrings.service.tr(),
                            //     //               style: const TextStyle(
                            //     //                 color: Colors.black,
                            //     //                 fontWeight:
                            //     //                 FontWeightManager.semiBold,
                            //     //                 fontFamily: FontConstants
                            //     //                     .cairoFontFamily,
                            //     //               ),
                            //     //             ),
                            //     //           ),
                            //     //           SizedBox(width: 12.w),
                            //     //           Container(
                            //     //             alignment: Alignment.center,
                            //     //             height: 40.h,
                            //     //             width: 110.w,
                            //     //             decoration: BoxDecoration(
                            //     //                 color: HexColor("#8281F8")
                            //     //                     .withOpacity(0.10),
                            //     //                 borderRadius:
                            //     //                 BorderRadius.circular(8)),
                            //     //             child: Text(
                            //     //               AppStrings.service.tr(),
                            //     //               style: const TextStyle(
                            //     //                 color: Colors.black,
                            //     //                 fontWeight:
                            //     //                 FontWeightManager.semiBold,
                            //     //                 fontFamily: FontConstants
                            //     //                     .cairoFontFamily,
                            //     //               ),
                            //     //             ),
                            //     //           ),
                            //     //           SizedBox(width: 12.w),
                            //     //           Container(
                            //     //             alignment: Alignment.center,
                            //     //             height: 40.h,
                            //     //             width: 90.w,
                            //     //             decoration: BoxDecoration(
                            //     //                 color: HexColor('#FFC57B')
                            //     //                     .withOpacity(0.10),
                            //     //                 borderRadius:
                            //     //                 BorderRadius.circular(8)),
                            //     //             child: Text(
                            //     //               AppStrings.service.tr(),
                            //     //               style: const TextStyle(
                            //     //                 color: Colors.black,
                            //     //                 fontWeight:
                            //     //                 FontWeightManager.semiBold,
                            //     //                 fontFamily: FontConstants
                            //     //                     .cairoFontFamily,
                            //     //               ),
                            //     //             ),
                            //     //           ),
                            //     //         ],
                            //     //       ),
                            //     //     ),
                            //     //     SizedBox(
                            //     //       height: 10.h,
                            //     //     ),
                            //     //     // FittedBox(
                            //     //     //   child: Row(
                            //     //     //     children: [
                            //     //     //       Container(
                            //     //     //         alignment: Alignment.center,
                            //     //     //         height: 40.h,
                            //     //     //         width: 90.w,
                            //     //     //         decoration: BoxDecoration(
                            //     //     //             color: HexColor('#FFC57B')
                            //     //     //                 .withOpacity(0.10),
                            //     //     //             borderRadius:
                            //     //     //             BorderRadius.circular(8)),
                            //     //     //         child: Text(
                            //     //     //           AppStrings.service.tr(),
                            //     //     //           style: const TextStyle(
                            //     //     //             color: Colors.black,
                            //     //     //             fontWeight:
                            //     //     //             FontWeightManager.semiBold,
                            //     //     //             fontFamily: FontConstants
                            //     //     //                 .cairoFontFamily,
                            //     //     //           ),
                            //     //     //         ),
                            //     //     //       ),
                            //     //     //       SizedBox(width: 12.w),
                            //     //     //       Container(
                            //     //     //         alignment: Alignment.center,
                            //     //     //         height: 40.h,
                            //     //     //         width: 90.w,
                            //     //     //         decoration: BoxDecoration(
                            //     //     //             color: HexColor("#EC8E6C")
                            //     //     //                 .withOpacity(0.10),
                            //     //     //             borderRadius:
                            //     //     //             BorderRadius.circular(8)),
                            //     //     //         child: Text(
                            //     //     //           AppStrings.service.tr(),
                            //     //     //           style: const TextStyle(
                            //     //     //             color: Colors.black,
                            //     //     //             fontWeight:
                            //     //     //             FontWeightManager.semiBold,
                            //     //     //             fontFamily: FontConstants
                            //     //     //                 .cairoFontFamily,
                            //     //     //           ),
                            //     //     //         ),
                            //     //     //       ),
                            //     //     //       SizedBox(width: 12.w),
                            //     //     //       Container(
                            //     //     //         alignment: Alignment.center,
                            //     //     //         height: 40.h,
                            //     //     //         width: 110.w,
                            //     //     //         decoration: BoxDecoration(
                            //     //     //             color: HexColor('#8281F8')
                            //     //     //                 .withOpacity(0.11),
                            //     //     //             borderRadius:
                            //     //     //             BorderRadius.circular(8)),
                            //     //     //         child: Text(
                            //     //     //           AppStrings.service.tr(),
                            //     //     //           style: const TextStyle(
                            //     //     //             color: Colors.black,
                            //     //     //             fontWeight:
                            //     //     //             FontWeightManager.semiBold,
                            //     //     //             fontFamily: FontConstants
                            //     //     //                 .cairoFontFamily,
                            //     //     //           ),
                            //     //     //         ),
                            //     //     //       ),
                            //     //     //     ],
                            //     //     //   ),
                            //     //     // ),
                            //     //   ],
                            //     // ),
                            //   ],
                            // ),
                            SizedBox(
                              height: 24.h,
                            ),
                            Align(
                              alignment: isRtl()
                                  ? Alignment.topRight
                                  : Alignment.topLeft,
                              child: Text(
                                AppStrings.bill.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeightManager.medium,
                                    fontFamily: FontConstants.cairoFontFamily,
                                    fontSize: 16),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Container(
                                padding: EdgeInsets.only(
                                    right: 25.w,
                                    left: 24.w,
                                    top: 21.h,
                                    bottom: 21.h),
                                height: 186.h,
                                width: 320.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: HexColor('#FFFFFF').withOpacity(0.24),
                                ),
                                child: Column(
                                  children: [
                                    rowItem(
                                        title: AppStrings.subtotal.tr(),
                                        subtitle: '125 ر.س'),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    rowItem(
                                        title: AppStrings.tax.tr(),
                                        subtitle: '12 %'),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    rowItem(
                                        title: AppStrings.total.tr(),
                                        subtitle: AppStrings.total.tr()),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 32.h,
                            ),
                            SizedBox(
                              height: 64.h,
                              width: 320.w,
                              child: ElevatedButton(
                                onPressed: () {
                                  // if (formKey.currentState!.validate()) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              AppointmentResultScreen(index: id,)),
                                          (route) => false);
                                  // }
                                },
                                child: Text(
                                  AppStrings.bookAppointment.tr(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: FontConstants.cairoFontFamily,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HexColor('#8281F8'),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(10))),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
            ),
          ), fallback: (context)=>const Center(child: CircularProgressIndicator()));
        }),
    );
  }
}
