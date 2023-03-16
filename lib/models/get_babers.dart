
import 'package:easy_localization/easy_localization.dart';

class GetBarbersModel {
  // late List <Data> data=[];
  late int status;
  late String ?message;


  GetBarbersModel.fromJson(Map<String, dynamic> json) {
        // data =  json['data'].forEach((v) {
        //   data.add(Data.fromJson(v));
        // });

    status = json['status'];
    message = json['message'];
  }
}

class Data {
 late  int id;
  late String name;
  late String phone;
  late String email;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

}

