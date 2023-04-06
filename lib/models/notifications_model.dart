class NotificationModel {
  bool ?status;
  String ?message;
  List<Data>? data;


  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data =  <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }


}

class Data {
  String? title;
  String ?message;


  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    message = json['message'];
  }
}