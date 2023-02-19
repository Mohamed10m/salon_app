import 'package:flutter/material.dart';

import '../../shared/componants/assets_manager.dart';

Widget buildCardItem({
  required Color color,
  required Color sColor,
  required String title,
  required String subtitle,
  required String trailing,
}) =>
    Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Container(
            height: 158,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: color,
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Container(
                      height: 41,
                      width: 29,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(ImageAssets.userImage),
                      )),
                    ),
                    title: Text(title),
                    subtitle: Text(subtitle),
                    trailing: Text(trailing),
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 16.0, right: 83, top: 16),
                    child: Container(
                      height: 32,
                      width: 98,
                      decoration: BoxDecoration(
                          color: sColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Center(
                        child: Text('احجز خدمة',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                      ),
                    ),
                  ),
                  // const SizedBox(height: 18,)
                ],
              ),
            )));
