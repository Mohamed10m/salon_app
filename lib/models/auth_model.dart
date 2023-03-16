class AuthModel {
  String? message;
  String? token;

  Data? data;

  AuthModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];

    data =  Data.fromJson(json['data']);
  }
}

class Data {
  String? name;
  String? email;
  String? phone;

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }
}
