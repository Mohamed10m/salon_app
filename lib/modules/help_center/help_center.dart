import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: background(child: Directionality(
                textDirection: TextDirection.rtl,
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
                            'المعلومات الشخصية',
                            style: TextStyle(
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                                fontSize: 16,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      const Align(
                          alignment: Alignment.topRight,
                          child: Text('كيف يمكننا مساعدتك؟', style: TextStyle(
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 16,
                          ),)),
                      const SizedBox(height: 16),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          height: 380.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: HexColor("#8281F8").withOpacity(0.20)),
                          child: const Text(
                              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.', style: TextStyle(
                            fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 16,
                          ),)),
                      const SizedBox(height: 24),
                      const Align(
                          alignment: Alignment.topRight,
                          child: Text('كيف يمكننا مساعدتك؟', style: TextStyle(
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 16,
                          ),)),
                      Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 24),
                          height: 380.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: HexColor("#8281F8").withOpacity(0.20)),
                          child: const Text(
                              'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص العربى مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل فى كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع.', style: TextStyle(
                            fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 16,
                          ),)),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              )
        )
    );
  }
}
