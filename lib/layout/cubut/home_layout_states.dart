
import 'package:salon_app/models/user_data_model.dart';

abstract class HomeLayoutStates {}

class ShopAppInitialStates extends HomeLayoutStates {}

class HomeLoadingStates extends HomeLayoutStates {}
class HomeSuccessStates extends HomeLayoutStates {}
class HomeErrorStates extends HomeLayoutStates {}

class ChangeBottomNavState extends HomeLayoutStates {}

class GetSuccessUserData extends HomeLayoutStates {
  final UserDataModel userData;
  GetSuccessUserData({required this.userData});
}
class GetErrorUserData extends HomeLayoutStates {}

class GetErrorBarberData extends HomeLayoutStates {}

class GetSuccessBarberData extends HomeLayoutStates {}
