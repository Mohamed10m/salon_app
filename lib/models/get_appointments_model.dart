

class AppointmentModel {
late  List<Data> data;
 late bool status;
 late String? message;
  AppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }


}

class Data {
 late int id;
late  String appointStart;
 late String appointEnd;
 late String barberName;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointStart = json['appoint_start'];
    appointEnd = json['appoint_end'];
    barberName = json['barber_name'];
  }


}