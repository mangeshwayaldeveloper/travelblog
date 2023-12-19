import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../provider/bookingFormProvider.dart';

class Hotel extends ConsumerStatefulWidget {
  const Hotel({super.key});

  @override
  ConsumerState<Hotel> createState() => _HotelState();
}

class _HotelState extends ConsumerState<Hotel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pickUp = TextEditingController();
  TextEditingController destination = TextEditingController();
  TextEditingController time = TextEditingController();
  TextEditingController inputDate = TextEditingController();
  TextEditingController SelectedInTime = TextEditingController();
  TextEditingController FromDate = TextEditingController();
  TimeOfDay CurrentTime = TimeOfDay.now();
  String? SelectPickup = "Pune"; // Set an initial value
  List pickupPoints = [
    "Pune",
    "Mumbai",
    "Delhi",
    "Bangalore",
    "Chennai",
    "Hyderabad"
  ];
  DateTime today = DateTime.now();
  @override
  void initState() {
    super.initState();
    inputDate.text = DateFormat("dd-MM-yyyy").format(today);
  }

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
                    "Hotel Booking Form",
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
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: FromDate,
                            // Use ApplicationDate controller here
                            decoration: InputDecoration(
                              hintText: "Select Date",
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Colors.brown,
                              ),
                            ),
                            onTap: () async {
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: today,
                                firstDate: DateTime.utc(2023),
                                currentDate: today,
                                lastDate: today.add(Duration(days: 30 * 6)),
                              );
                              if (pickedDate != null) {
                                String formattedDate =
                                DateFormat("dd-MM-yyyy").format(pickedDate);
                                setState(() {
                                  FromDate.text =
                                      formattedDate; // Update ApplicationDate controller
                                });
                              }
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButtonFormField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.list,
                                color: Colors.orange,
                              ),
                              hintText: "--Select--",
                            ),
                            value: SelectPickup,
                            onChanged: (newValue) {
                              setState(() {
                                SelectPickup = newValue as String;
                              });
                            },
                            items: pickupPoints.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                            validator: (value) {
                              if (value == null) {
                                return 'Destination is required';
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
                                hintText: "Hotel Name"),
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
                              controller: SelectedInTime,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.watch,
                                    color: Colors.green,
                                  ),
                                  hintText: "In Time"),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Destination is required';
                                }
                                return null;
                              },
                              onTap: () async {
                                FocusScope.of(context)
                                    .requestFocus(new FocusNode());
                                final TimeOfDay? picked = await showTimePicker(
                                    context: context, initialTime: CurrentTime);
                                if (picked != null && picked != CurrentTime) {
                                  setState(() {
                                    CurrentTime = picked;
                                    SelectedInTime.text =
                                        picked.format(context);
                                  });
                                }
                              }),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width / 2,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                final formData = BookingData(
                                  name: name.text,
                                  phone: phone.text,
                                  email: email.text,
                                  pickUp: SelectPickup!,
                                  destination: destination.text,
                                  SelectedInTime: SelectedInTime.text,
                                  date: FromDate.text,
                                );
                                await uploadFormData(formData);
                                ref.watch(formProvider).add(formData);
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
                                FromDate.clear();
                                pickupPoints.clear();
                                destination.clear();
                                SelectedInTime.clear();
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

Future<void> uploadFormData(BookingData formData) async {
  try {
    await FirebaseFirestore.instance.collection('bookings').add({
      'name': formData.name,
      'phone': formData.phone,
      'email': formData.email,
      'date': formData.date,
      'pickUp': formData.pickUp, // Use correct field name
      'destination': formData.destination,
      'time': formData.SelectedInTime,
      'category':"hotel"
    });

    // You can add additional logic or error handling here if needed.
  } catch (e) {
    print('Error uploading form data: $e');
  }
}
