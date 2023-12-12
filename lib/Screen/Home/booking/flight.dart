import 'package:flutter/material.dart';
import 'package:travel_booking/Screen/Destinations/popluarDestination.dart';

import '../../../widgets/popluarDestination.dart';

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
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Flight Booking",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Book For Destination",
                style: TextStyle(fontSize: 20),
              ),
            ),
            popularDestinationFlight(),
            Container(
                child: ElevatedButton(
                    onPressed: () {}, child: Text("Book Flight")))
          ],
        ),
      ),
    );
  }
}
