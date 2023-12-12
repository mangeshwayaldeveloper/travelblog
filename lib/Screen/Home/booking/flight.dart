import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightBooking extends StatefulWidget {
  const FlightBooking({super.key});

  @override
  State<FlightBooking> createState() => _FlightBookingState();
}

class _FlightBookingState extends State<FlightBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flight Booking"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Flight Booking"),
          ],
        ),
      ),
    );
  }
}
