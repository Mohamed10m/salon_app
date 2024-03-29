import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _PaymentScreenState();
}

bool isButtonPressed = false;
void buttonPressed() {
  if (isButtonPressed == false) {
    isButtonPressed = true;
  } else if (isButtonPressed == true) {
    isButtonPressed = false;
  }
}

class _PaymentScreenState extends State<AddCard> {
  var namedController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: SizedBox(
            child: isButtonPressed
                ? null
                : Container(
                    height: 64.h,
                    width: 320.w,
                    color: HexColor("#f4eef3"),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          backgroundColor: HexColor('#8281F8'),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          setState(() {
                            buttonPressed();
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                                width: 17.w,
                                height: 17.h,
                                image: const AssetImage(ImageAssets.addIcon)),
                            SizedBox(
                              width: 8.w,
                            ),
                            const Text(
                              'اضف بطاقة جديدة',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.background),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 53, right: 36, left: 36),
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
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.cairoFontFamily,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        'اختر البطاقة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeightManager.semiBold,
                          fontFamily: FontConstants.cairoFontFamily,
                        ),
                      )),
                  const SizedBox(height: 16),
                  Container(
                    height: 81.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#FFFFFF").withOpacity(0.24)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 46,
                          width: 73,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(ImageAssets.cardImage))),
                        ),
                        title: Text('visa',
                            style: Theme.of(context).textTheme.bodyLarge),
                        subtitle: Text('**********565',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.keyboard_arrow_down_sharp)),
                        onTap: () {},
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: isButtonPressed
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                const Text('اضف بطاقة جديدة',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(
                                  height: 20.h,
                                ),
                                Form(
                                  key: formKey,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.w, vertical: 25.h),
                                      height: 350.h,
                                      width: 320.w,
                                      decoration: BoxDecoration(
                                          color: HexColor('#FFFFFF')
                                              .withOpacity(0.24)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'اسم صاحب البطاقة',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          customFormField(
                                            fill: false,
                                            text: "",
                                            hintStyle: const TextStyle(
                                                color: Colors.grey),
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "name must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: namedController,
                                            type: TextInputType.name,
                                          ),
                                          const SizedBox(
                                            height: 36,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'تاريخ الانتهاء',
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
                                                      text: "",
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
                                                    const Text(
                                                      'cvv',
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
                                                      text: "",
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 24.h,
                                          ),
                                          SizedBox(
                                              height: 64.h,
                                              width: 320.w,
                                              child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0.0,
                                                    backgroundColor:
                                                        HexColor('#8281F8'),
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                                            Text(
                                                              'اضف البطاقة',
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ],
                                                        )
                                                      : null)),
                                        ],
                                      )),
                                ),
                              ],
                            )
                          : null),
                ],
              ),
            ),
          ),
        ));
  }
}
