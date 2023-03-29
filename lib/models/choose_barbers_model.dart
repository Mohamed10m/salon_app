class ChooseBarberModel {
  Data ?data;
  int? status;
  String? message;

  ChooseBarberModel.fromJson(Map<String, dynamic> json) {

    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  int? id;
  int ?type;
  String? name;
 String? phone;
  String? email ;
  String? image ;

  Data.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    name= json['name'];
    phone= json['phone'];
    email= json['email'];
    image= json['image'];



  }
}
