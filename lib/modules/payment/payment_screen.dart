import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../layout/cubut/shop_layout_cubit.dart';
import '../../layout/cubut/shop_layout_states.dart';
import '../../shared/componants/componants.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

bool isButtonPressed = false;
void buttonPressed() {
  if (isButtonPressed == false) {
    isButtonPressed = true;
  } else if (isButtonPressed == true) {
    isButtonPressed = false;
  }
}

class _PaymentScreenState extends State<PaymentScreen> {
  var namedController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              backgroundColor: ColorManager.scaffoldBackgroundColor,
              body: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageAssets.background),
                          fit: BoxFit.cover)),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 53, right: 36, left: 36),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Icon(Icons.arrow_back)),
                              SizedBox(
                                width: 71.w,
                              ),
                              const Text(
                                'طرق الدفع و السداد',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    fontFamily:
                                        'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 44),
                          const Align(
                              alignment: Alignment.topRight,
                              child: Text('اختر البطاقة')),
                          const SizedBox(height: 16),
                          Container(
                            height: 81.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor("#8281F8").withOpacity(0.20)),
                            child: Center(
                              child: ListTile(
                                leading: Container(
                                  height: 46,
                                  width: 73,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              ImageAssets.cardImage))),
                                  child: Icon(
                                    Icons.person,
                                    color: HexColor('#8281F8'),
                                  ),
                                ),
                                title: Text('visa',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                subtitle: Text('**********565',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                                trailing: const Directionality(
                                    textDirection: TextDirection.ltr,
                                    child:
                                        Icon(Icons.keyboard_arrow_down_sharp)),
                                onTap: () {},
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.topRight,
                              child: isButtonPressed
                                  ? Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('اضف بطاقة جديدة'),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Form(
                                          key: formKey,
                                          child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 25),
                                              height: 280,
                                              width: 320,
                                              decoration: BoxDecoration(
                                                  color: HexColor('#FFFFFF')
                                                      .withOpacity(0.24)),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'اسم صاحب البطاقة',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    customFormField(
                                                      fill: false,
                                                      text: "omnia nihad",
                                                      hintStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.grey),
                                                      validate:
                                                          (String? value) {
                                                        if (value!.isEmpty) {
                                                          return "Password must not be empty";
                                                        } else {
                                                          return null;
                                                        }
                                                      },
                                                      controller:
                                                          namedController,
                                                      type: TextInputType.name,
                                                    ),
                                                    const SizedBox(
                                                      height: 36,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              const Text(
                                                                'تاريخ الانتهاء',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              customFormField(
                                                                fill: false,
                                                                text:
                                                                    "omnia nihad",
                                                                hintStyle: const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                                validate:
                                                                    (String?
                                                                        value) {
                                                                  if (value!
                                                                      .isEmpty) {
                                                                    return "Password must not be empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                controller:
                                                                    namedController,
                                                                type:
                                                                    TextInputType
                                                                        .name,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            children: [
                                                              const Text(
                                                                'cvv',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              customFormField(
                                                                fill: false,
                                                                text:
                                                                    "omnia nihad",
                                                                hintStyle: const TextStyle(
                                                                    color: Colors
                                                                        .grey),
                                                                validate:
                                                                    (String?
                                                                        value) {
                                                                  if (value!
                                                                      .isEmpty) {
                                                                    return "Password must not be empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                controller:
                                                                    namedController,
                                                                type:
                                                                    TextInputType
                                                                        .name,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 64.h,
                                                      width: 320.w,
                                                      child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              HexColor(
                                                                  '#8281F8'),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            buttonPressed();
                                                          });
                                                        },
                                                        child: isButtonPressed
                                                            ? Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: const [
                                                                  Image(
                                                                      image: AssetImage(
                                                                          ImageAssets
                                                                              .addIcon)),
                                                                  SizedBox(
                                                                    width: 8,
                                                                  ),
                                                                  Text(
                                                                    'اضف بطاقة',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ],
                                                              )
                                                            : const Center(
                                                                child: Text(
                                                                  ' جديدةاضف البطاقة',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                              ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    )
                                  : null),
                          const Spacer(),
                          SizedBox(
                              child: isButtonPressed
                                  ? null
                                  : Column(
                                      children: [
                                        SizedBox(
                                          height: 64.h,
                                          width: 320.w,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  HexColor('#8281F8'),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                buttonPressed();
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Image(
                                                    image: AssetImage(
                                                        ImageAssets.addIcon)),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'اضف بطاقة جديدة',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 34.h,
                                        ),
                                      ],
                                    )),
                        ],
                      ),
                    ),
                  ),
              ),
    );
  }
}
