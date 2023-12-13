import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_booking/provider/bookingFormProvider.dart';

class MyOrders extends ConsumerStatefulWidget {
  const MyOrders({super.key});

  @override
  ConsumerState<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends ConsumerState<MyOrders> {
  @override
  Widget build(BuildContext context) {
    List<BookingData> bookedData = ref.watch(formProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Orders'),
      ),
      body: bookedData.isEmpty
          ? Center(
              child: Text('No orders yet.'),
            )
          : ListView.builder(
              itemCount: bookedData.length,
              itemBuilder: (context, index) {
                BookingData booking = bookedData[index];
                return Expanded(
                  child: ListTile(
                    title: Text('Name: ${booking.name}'),
                    subtitle: Text('Phone: ${booking.phone}'),
                    // Add more details as needed
                  ),
                );
              },
            ),
    );
  }
}
