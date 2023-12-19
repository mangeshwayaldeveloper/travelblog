import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/Screen/Destinations/popluarDestination.dart';
import 'package:travel_booking/Screen/Destinations/widget/flight_booking_form.dart';
import 'package:travel_booking/provider/bookingFormProvider.dart';

class FlightBookingIng extends ConsumerStatefulWidget {
  const FlightBookingIng({super.key});

  @override
  ConsumerState<FlightBookingIng> createState() => _FlightBookingState();
}

class _FlightBookingState extends ConsumerState<FlightBookingIng> {
  @override
  Widget build(BuildContext context) {
    final List<BookingData> bookedData = ref.watch(formProvider);
    print(bookedData.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Flight Booking"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlightBookingForm()
            ],
          ),
        ),
      ),
    );
  }
}
