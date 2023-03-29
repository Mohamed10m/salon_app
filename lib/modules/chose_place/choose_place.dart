import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_app/shared/componants/app_strings.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../layout/home_layout/home_layout.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

class ChosePlace extends StatefulWidget {
  const ChosePlace({Key? key}) : super(key: key);

  @override
  State<ChosePlace> createState() => _ChosePlaceState();
}

class _ChosePlaceState extends State<ChosePlace> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context).getBarbersModel;
          return  Scaffold(
                      body: SafeArea(
                        child: Container(
                    decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageAssets.background),
                              fit: BoxFit.cover)),
                    child: ConditionalBuilder(
                        condition: cubit != null,
                        builder: (context) => SingleChildScrollView(
                          child: Column(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 50.h,bottom: 32.h),
                            child: Text(
                              AppStrings.discoverBarbershops.tr(),
                              style: const TextStyle(
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
                                mainAxisSpacing: 1.h,
                                crossAxisSpacing: 20.w,
                                childAspectRatio: 1.h / 1.56.h,
                                children: List.generate(
                                  cubit!.data!.length,
                                  (index) => FittedBox(
                                    child: InkWell(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  image: DecorationImage(
                                                      image: NetworkImage(cubit
                                                          .data![index].image!),
                                                      fit: BoxFit.cover)),
                                              height: 224.h,
                                              width: 151.w,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 4.h,
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: Text(
                                                cubit.data![index].name!,
                                                style: const TextStyle(
                                                  fontWeight:
                                                      FontWeightManager.medium,
                                                  fontFamily: FontConstants
                                                      .cairoFontFamily,
                                                ),
                                              )),
                                          SizedBox(
                                            height: 14.h,
                                          )
                                        ],
                                      ),
                                      onTap: () {
                                        navigateTo(context,HomeLayout(id: cubit.data![index].id!));
                                      },
                                    ),
                                  ),
                                )),
                          ),
                    ]),
                        ),
                          fallback: (BuildContext context) =>
                          const Center(child: CircularProgressIndicator())
                    )),
                      ),
             );
        });
  }
}
