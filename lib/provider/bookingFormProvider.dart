import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookingData {
  String name;
  String phone;
  String email;
  String date;
  String pickUp;
  String destination;
  String SelectedInTime;

  BookingData({
    required this.name,
    required this.phone,
    required this.email,
    required this.date,
    required this.pickUp,
    required this.destination,
    required this.SelectedInTime,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      date: json['date'],
      pickUp: json['pickUp'],
      destination: json['destination'],
      SelectedInTime: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'phone': phone,
      'email': email,
      'date': date,
      'pickUp': pickUp,
      'destination': destination,
      'Selectedtime':SelectedInTime,
    };
    return data;
  }
}

final formProvider = StateProvider<List<BookingData>>((ref) {
  return [];
});
