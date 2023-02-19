import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'color_manager.dart';

Widget customFormField({
  required TextEditingController controller,
  required String text,
  TextStyle hintStyle =
      const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
  bool? enabled,
  bool obSecureText = false,
  IconData? suffix,
  bool fill = true,
  Function? suffixPressed,
  TextInputType? type,
  FormFieldValidator<String>? validate,
}) =>
    TextFormField(
        cursorRadius: const Radius.circular(40),
        obscureText: obSecureText,
        enabled: enabled,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            filled: fill,
            fillColor: HexColor('#FFFFFF').withOpacity(0.2),
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
            hintStyle: hintStyle));

Widget elevatedButton({required String text, required Function onPress}) =>
    ElevatedButton(
      onPressed: () {
        onPress();
      },
      child: Text(
        text,
        style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    );
