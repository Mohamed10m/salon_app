import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';
import '../../shared/componants/componants.dart';
import '../cubut/shop_layout_cubit.dart';
import '../cubut/shop_layout_states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeLayoutCubit(),
      child: BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context);

          return Scaffold(
            body: background(
              child: cubit.bottomScreens[cubit.currentIndex],
            ),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.only(
                  bottom: 21.0.h, right: 36.w, left: 35.w, top: 15.h),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: SizedBox(
                  height: 72,
                  width: 320,
                  child: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0.0,
                    backgroundColor: HexColor("#8281F8").withOpacity(0.10),
                    currentIndex: cubit.currentIndex,
                    onTap: (index) {
                      cubit.changeBottom(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: Column(
                          children: const [
                            Image(
                              height: 24,
                              image: AssetImage(ImageAssets.personIcon),
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
                              image: AssetImage(ImageAssets.personIcon),
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
                                image: AssetImage(ImageAssets.appointNavIcon),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Image(image: AssetImage(ImageAssets.lineIcon)),
                            ],
                          ),
                          icon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                height: 24,
                                width: 25,
                                image: AssetImage(ImageAssets.appointNavIcon),
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
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
