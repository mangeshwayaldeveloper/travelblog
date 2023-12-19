import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/provider/bookingFormProvider.dart';

class MyOrders extends ConsumerStatefulWidget {
  const MyOrders({super.key});

  @override
  ConsumerState<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends ConsumerState<MyOrders> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('bookings').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var bookings = snapshot.data!.docs;

          return ListView.builder(
            itemCount: bookings.length,
            itemBuilder: (context, index) {
              var booking = bookings[index].data() as Map<String, dynamic>;

              return ListTile(
                title: Text('Name: ${booking['name']}'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Booking For ${booking['category']}",style: TextStyle(fontWeight: FontWeight.bold),),
                    Text('Phone: ${booking['phone']}'),
                    Text('Email: ${booking['email']}'),
                    Text('Date: ${booking['date']}'),
                    Text('Pickup: ${booking['pickUp']}'),
                    Text('Destination: ${booking['destination']}'),
                    Text('Time: ${booking['time']}'),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}