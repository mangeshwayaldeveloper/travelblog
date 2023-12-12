import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/Screen/Destinations/popluarDestination.dart';
import 'package:travel_booking/Screen/Destinations/widget/flight_booking_form.dart';
import 'package:travel_booking/provider/bookingFormProvider.dart';

class FlightBooking extends ConsumerStatefulWidget {
  const FlightBooking({super.key});

  @override
  ConsumerState<FlightBooking> createState() => _FlightBookingState();
}

class _FlightBookingState extends ConsumerState<FlightBooking> {
  @override
  Widget build(BuildContext context) {
    final List<BookingData> bookedData=ref.watch(formProvider);
    print(bookedData.toString());
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FlightBookingForm()));
                    },
                    child: Text("Book Flight")))
          ],
        ),
      ),
    );
  }
}
