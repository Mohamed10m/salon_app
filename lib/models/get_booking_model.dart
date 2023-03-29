class BookingModel {
  List<Data> ?data;
  bool ?status;
  String? message;


  BookingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
  }
}

class Data {
  int? id;
  int ?customerId;
  int ?barberId;
  int ?appointmentId;
  int ?serviceId;
  String? bookingDate;
  String ?requirements;
  int ?status;



  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    barberId = json['barber_id'];
    appointmentId = json['appointment_id'];
    serviceId = json['service_id'];
    bookingDate = json['booking_date'];
    requirements = json['requirements'];
    status = json['status'];
  }
}