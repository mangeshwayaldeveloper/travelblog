import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlightBookingForm extends StatefulWidget {
  const FlightBookingForm({super.key});

  @override
  State<FlightBookingForm> createState() => _FlightBookingFormState();
}

class _FlightBookingFormState extends State<FlightBookingForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Text("Flight Booking Form",style: TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
