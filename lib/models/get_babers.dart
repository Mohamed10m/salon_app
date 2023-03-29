class GetBarbersModel {
  List<Data>? data;

  GetBarbersModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }


}

class Data {
  int? id;
  String? name;
  String? phone;
  String? image;
  String? email;


  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    email = json['email'];
  }

 
}