
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salon_app/layout/cubut/home_layout_states.dart';
import 'package:salon_app/models/choose_barbers_model.dart';

import 'package:salon_app/models/get_babers.dart';
import 'package:salon_app/models/get_booking_model.dart';
import 'package:salon_app/models/get_choose_services.dart';
import 'package:salon_app/models/get_service_model.dart';
import 'package:salon_app/models/get_specific_appointment_model.dart';
import 'package:salon_app/models/show_data_user.dart';

import 'package:salon_app/shared/end_points/end_points.dart';

import '../../models/change_password.dart';
import '../../models/choose_sevices_model.dart';
import '../../models/get_appointments_model.dart';
import '../../models/user_data_model.dart';

import '../../shared/componants/app_constane.dart';
import '../../shared/remote_data_source/remote_data_source.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(AppInitialStates());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;



  void changeBottom(int index) {
    currentIndex = index;
    emit(ChangeBottomNavState());
  }

  UserDataModel? userModel;

  void getUserData() async {
    await DioHelper.getData(path: profile, token: token).then((value) {
      userModel = UserDataModel.fromJson(value.data);
      emit(GetSuccessUserData(userData: userModel!));
    }).catchError((error) {
      emit(GetErrorUserData());
    });
  }

  GetBarbersModel? getBarbersModel;

  void getBarberData() async {
    await DioHelper.getData(path: getBarber, token: token).then((value) {
      getBarbersModel = GetBarbersModel.fromJson(value.data);
      emit(GetSuccessBarberData());
    }).catchError((error) {
      emit(GetErrorBarberData());
    });
  }

  ChooseBarberModel? chooseBarbersModel;

 Future  <String?> getChooseBarberData(int id) async {
    await DioHelper.getData(
        path: 'https://www.salon.spider-te8.com/api/barbers/$id',
        token: token)
        .then((value) async {
      chooseBarbersModel = ChooseBarberModel.fromJson(value.data);

      emit(GetSuccessBarberData());
    }).catchError((error) {
      emit(GetErrorBarberData());
    });
    return null;
  }

  GetServicesModel? getServicesModel;

  void getServices() async {
    await DioHelper.getData(path: getService, token: token).then((value) {
      getServicesModel = GetServicesModel.fromJson(value.data);

      emit(GetSuccessServicesData());
    }).catchError((error) {
      emit(ErrorChooseServiceData());
    });
  }



  ChooseServices? chooseServicesDate;

  void chooseServices({
    required String serviceId,
    required int customerId,
    required String barberId,
    required String date,

  }) {
    emit(LoadingChooseServiceData());
    print('888888888888888');

    DioHelper.postData(
      token: token,
      path: chooseServicesData,
      data: {
        'service_id': serviceId,
        'customer_id': customerId,
        'barber_id':barberId,
        'date':date,
      },

    ).then((value) {


      emit(SuccessChooseServiceData());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateErrorStatusData());
    });
  }


  AppointmentModel? appointmentModel;

  void getAppointments() async {
    await DioHelper.getData(path: getAppointment, token: token).then((value) {
      appointmentModel = AppointmentModel.fromJson(value.data);

      emit(GetAppointmentSuccessData());
    }).catchError((error) {
      emit(GetAppointmentErrorData());
    });
  }
 ShowDataUser? showData;

  void getShowDataUser() async {
    await DioHelper.getData(path: showDataUser, token: token).then((value) {
      showData = ShowDataUser.fromJson(value.data);

      emit(GetAppointmentSuccessData());
    }).catchError((error) {
      emit(GetAppointmentErrorData());
    });
  }

  BookingModel? bookingModel;

  void getBookingData() async {
    await DioHelper.getData(path: getBooking, token: token).then((value) {
      bookingModel = BookingModel.fromJson(value.data);

      emit(GetSuccessServicesData());
    }).catchError((error) {
      emit(GetErrorServicesData());
    });
  }

  SpecificAppointmentModel? specificAppointmentModel;

  void getSpecificData(int id) async {
    await DioHelper.getData(
        path: 'https://www.salon.spider-te8.com/api/appointments/$id',
        token: token).then((value) {
      specificAppointmentModel = SpecificAppointmentModel.fromJson(value.data);


      emit(GetSuccessServicesData());
    }).catchError((error) {
      emit(GetErrorServicesData());
    });
  }

  GetChooseServices ?getChooseServices;
 void getChooseServicesData() async {
   emit(GetChooseServiceLoadingData());
    await DioHelper.getData(
        path:getChooseService,
        token: token).then((value) {
          // print(value.data.toString());
          print('0000000000');
      getChooseServices = GetChooseServices.fromJson(value.data);
      print('gggggggggg${value.data}');

      emit(GetChooseServiceSuccessData());
    }).catchError((error) {
      emit(GetChooseServiceErrorData());
    });
  }

  ChangePasswordModel? changePasswordModel;

  void changePassword({
    required String email,
    required int code,
    required String newPassword,
    required String newPasswordConfirmation,

  }) {
    emit(LoadingChooseServiceData());
    print('888888888888888');

    DioHelper.postData(
      token: token,
      path: changePass,
      data: {
        'email': email,
        'code': code,
        'new_password':newPassword,
        'new_password_confirmation':newPasswordConfirmation,
      },

    ).then((value) {

print(value.data);
      emit(SuccessChooseServiceData());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateErrorStatusData());
    });
  }



// UpdateStatus? updateStatus;
  //
  // void updateStatusData({required String bookingDate,
  //   required int status,
  //   required String requirements,
  //   required String createdAt,
  //   required String updatedAt}) {
  //   emit(UpdateLoadingStatusData());
  //
  //   DioHelper.postData(
  //     path: register,
  //     data: {
  //       'booking_date': bookingDate,
  //       'status': status,
  //       'requirements': requirements,
  //       'created_at': createdAt,
  //       'updated_at': updatedAt
  //     },
  //   ).then((value) {
  //     updateStatus = UpdateStatus.fromJson(value.data);
  //
  //     emit(UpdateSuccessStatusData());
  //   }).catchError((error) {
  //     emit(UpdateErrorStatusData());
  //   });
  // }
  //


}
