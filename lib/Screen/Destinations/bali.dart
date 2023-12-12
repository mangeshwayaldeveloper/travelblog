import 'package:flutter/material.dart';
import 'package:travel_booking/Screen/Destinations/widget/flight_booking_form.dart';

class Bali extends StatefulWidget {
  const Bali({super.key});

  @override
  State<Bali> createState() => _BaliState();
}

class _BaliState extends State<Bali> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2.7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Bali",
              style: TextStyle(fontSize: 25),
            ),
            Image.asset("Images/images/destination_bali.png"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Bali is an Indonesian island known for its forested volcanic mountains, iconic rice paddies, beaches, and coral reefs. It is part of the Indonesian archipelago and is located in the westernmost end of the Lesser Sunda Islands, lying between Java to the west and Lombok to the east. Here are some key aspects of Bali",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FlightBookingForm()));
                },
                child: Text("Book Flight")),
          ],
        ),
      ),
    ));
  }
}
