import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/layout/cubut/home_layout_states.dart';
import 'package:salon_app/models/get_babers.dart';

import 'package:salon_app/shared/end_points/end_points.dart';

import '../../models/user_data_model.dart';
import '../../modules/appointment/booking.dart';
import '../../modules/home/home_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../shared/componants/app_constane.dart';
import '../../shared/remote_data_source/remote_data_source.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(ShopAppInitialStates());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;



  List<Widget> bottomScreens = [
    const HomeScreen(),
    const BookingScreen(),
    const SettingsPage(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  UserDataModel? userModel;

  void getUserData() {
    DioHelper.getData(path: profile, token: token).then((value) {
      userModel = UserDataModel.fromJson(value.data);
      print(value.data.toString());
      emit(GetSuccessUserData(userData: userModel!));
    }).catchError((error) {
      emit(GetErrorUserData());
    });
  }


  GetBarbersModel? getBarbersModel;
  void getBarberData() async{
    print('test1');
   await DioHelper.getData(path: getBarber, token:token).then((value) {
      print('test2');
      getBarbersModel = GetBarbersModel.fromJson(value.data);

      print(value.data);
      // print(getBarbersModel!.data[1]);
      print('test3');

      emit(GetSuccessBarberData());
    }).catchError((error) {
      print(error.toString());
      emit(GetErrorBarberData());
    });
  }


}
