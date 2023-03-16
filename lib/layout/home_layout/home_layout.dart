import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../../shared/componants/componants.dart';
import '../cubut/home_layout_cubit.dart';
import '../cubut/home_layout_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext contextApp)=>HomeLayoutCubit()..getUserData()..getBarberData(),
    child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeLayoutCubit.get(context);

        return Scaffold(
          body: background(
            child: cubit.bottomScreens[cubit.currentIndex],
          ),
          bottomNavigationBar: Container(
            color: HexColor("#eaeaf5"),
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 18.0.h,
                right: 30.w,
                left: 30.w,
                top: 15.h,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 75,
                  width: MediaQuery.of(context).size.width,
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0.0,
                    backgroundColor: HexColor("#e2e1fc"),
                    currentIndex: cubit.currentIndex,
                    onTap: (index) => cubit.changeBottom(index),
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: Column(
                          children: const [
                            Image(
                              height: 24,
                              width: 25,
                              image: AssetImage(ImageAssets.homeIcon),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Image(image: AssetImage(ImageAssets.lineIcon)),
                          ],
                        ),
                        icon: Column(
                          children: const [
                            Image(
                              height: 24,
                              width: 25,
                              image: AssetImage(ImageAssets.homeIcon),
                            ),
                          ],
                        ),
                        label: '',
                      ),
                      BottomNavigationBarItem(
                          activeIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                height: 24,
                                width: 25,
                                image:
                                AssetImage(ImageAssets.appointNavIcon),
                              ),
                              SizedBox(height: 8),
                              Image(
                                  image: AssetImage(ImageAssets.lineIcon)),
                            ],
                          ),
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                height: 24,
                                width: 25,
                                image:
                                AssetImage(ImageAssets.appointNavIcon),
                              ),
                            ],
                          ),
                          label: ''),
                      BottomNavigationBarItem(
                        activeIcon: Column(
                          children: const [
                            Image(
                              height: 24,
                              width: 25,
                              image: AssetImage(ImageAssets.personIcon),
                            ),
                            SizedBox(height: 8),
                            Image(image: AssetImage(ImageAssets.lineIcon)),
                          ],
                        ),
                        icon: Column(
                          children: const [
                            Image(
                              height: 24,
                              width: 25,
                              image: AssetImage(ImageAssets.personIcon),
                            ),
                          ],
                        ),
                        label: '',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    )
    );
  }
}
