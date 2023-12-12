class BookingData {
  String name;
  String phone;
  String email;
  String date;
  String pickUp;
  String destination;
  String time;

  BookingData({
    required this.name,
    required this.phone,
    required this.email,
    required this.date,
    required this.pickUp,
    required this.destination,
    required this.time,
  });

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      date: json['date'],
      pickUp: json['pickUp'],
      destination: json['destination'],
      time: json['time'],
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
      'time': time,
    };
    return data;
  }
}
