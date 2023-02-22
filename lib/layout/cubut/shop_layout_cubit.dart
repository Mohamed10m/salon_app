import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/layout/cubut/shop_layout_states.dart';

import '../../modules/appointment/booking.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/settings/settings_screen.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(ShopAppInitialStates());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 2;

  List<Widget> bottomScreens = [
    const SettingsPage(),
    const BookingScreen(),
    const HomeScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }
}
