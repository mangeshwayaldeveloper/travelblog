import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_booking/Screen/MyOrders.dart';
import 'package:travel_booking/Screen/blogs.dart';
import 'package:travel_booking/Screen/home.dart';
import 'package:travel_booking/constants/color_constant.dart';

import '../Screen/Profile.dart';

class BottomNavigationTravel extends StatefulWidget {
  const BottomNavigationTravel({super.key});

  @override
  State<BottomNavigationTravel> createState() => _BottomNavigationTravelState();
}

class _BottomNavigationTravelState extends State<BottomNavigationTravel> {
  int _selectedIndex = 0;

  List<Widget>_screens=[
    HomeScreen(),
    MyOrders(),
    Blogs(),
    Profile()
  ];
  var bottomtextStyle =
      GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500);

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => HomeScreen()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => MyOrders()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Blogs()));
          break;
        case 3:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Profile()));
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
          color: mFillColor,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 15,
                offset: Offset(0, 5))
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24), topRight: Radius.circular(24))),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: _selectedIndex == 0
                  ? SvgPicture.asset('Images/icons/home_colored.svg')
                  : SvgPicture.asset("Images/icons/home.svg"),
              label: "Home"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 1
                  ? SvgPicture.asset("Images/icons/order_colored.svg")
                  : SvgPicture.asset("Images/icons/order.svg"),
              label: "My Order"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 2
                  ? SvgPicture.asset("Images/icons/watch_colored.svg")
                  : SvgPicture.asset("Images/icons/watch.svg"),
              label: "Watch List"),
          BottomNavigationBarItem(
              icon: _selectedIndex == 3
                  ? SvgPicture.asset('Images/icons/account_colored.svg')
                  : SvgPicture.asset("Images/icons/account.svg"),
              label: "Account")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mGreyColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
