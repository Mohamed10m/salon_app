import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'color_manager.dart';

Widget customFormField({
  required String valueKey,
  required TextEditingController controller,
  required String text,
  bool? enabled,
  bool obSecureText = false,
  IconData? suffix,
  Function? suffixPressed,
   TextInputType ?type,
  FormFieldValidator<String>? validate,
}) =>
    TextFormField(
        obscureText: obSecureText,
        enabled: enabled,
        key: ValueKey(valueKey),
        decoration: InputDecoration(
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: () {
                    suffixPressed!();
                  },
                  icon: Icon(
                    suffix,
                    color: Colors.grey,
                    size: 28,
                  ))
              : null,
          border: InputBorder.none,
          hintText: text,
        )
    );

Widget elevatedButton(
{
  required String text,
  required Function onPress
}
    )=>ElevatedButton(
onPressed:(){onPress();},
child:  Text(
  text,
  style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w700),
),
style: ElevatedButton.styleFrom(
primary:ColorManager.buttonColor,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(10))),
);
