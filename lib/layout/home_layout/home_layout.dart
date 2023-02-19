import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';
import 'package:sweet_nav_bar/sweet_nav_bar.dart';

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

          return Stack(
            children: [
              Scaffold(
                  backgroundColor: ColorManager.scaffoldBackgroundColor,
                  body: cubit.bottomScreens[cubit.currentIndex],
                  bottomNavigationBar: SweetNavBar(
                    backgroundColor: HexColor('#8281F8'),
                    height: 72,
                    currentIndex: 0,
                    items: [
                      SweetNavBarItem(
                        sweetIcon: Icon(
                          Icons.home_outlined,
                          color: HexColor('#8281F8'),
                        ),
                        sweetLabel: 'Home',
                        // iconColors:,
                      ),
                      SweetNavBarItem(
                          sweetIcon: Icon(
                            Icons.book_online,
                            color: HexColor('#8281F8'),
                          ),
                          sweetLabel: 'Appointment'),
                      SweetNavBarItem(
                          sweetIcon: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                          sweetLabel: 'person'),
                    ],
                    onTap: (index) {
                      cubit.changeBottom(index);
                    },
                  )),
            ],
          );
        },
      ),
    );
  }
}
