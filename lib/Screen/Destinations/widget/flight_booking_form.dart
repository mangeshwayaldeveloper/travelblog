import 'package:flutter/material.dart';

class FlightBookingForm extends StatefulWidget {
  const FlightBookingForm({Key? key}) : super(key: key);

  @override
  State<FlightBookingForm> createState() => _FlightBookingFormState();
}

class _FlightBookingFormState extends State<FlightBookingForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController pickUp = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController time = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Flight Booking Form",
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: name,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.red,
                                ),
                                hintText: "Enter Your Name"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: phone,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.dialpad,
                                  color: Colors.green,
                                ),
                                hintText: "Phone Number"),
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Phone number is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                hintText: "Email"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: date,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.calendar_month_outlined),
                                hintText: "Enter Date"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Date is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: pickUp,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on_outlined),
                                hintText: "PickUp Point"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'PickUp Point is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: destination,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on),
                                hintText: "Destination"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Destination is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: time,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.watch),
                                hintText: "Time"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Time is required';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                print("booked");
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Booked"),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                                name.clear();
                                phone.clear();
                                email.clear();
                                date.clear();
                                pickUp.clear();
                                destination.clear();
                                time.clear();
                              }
                            },
                            child: Text("Book"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
