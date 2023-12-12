import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:travel_booking/Screen/Home/booking/flight.dart';
import 'package:travel_booking/constants/color_constant.dart';
import 'package:travel_booking/constants/style.dart';
import 'package:travel_booking/models/carousel_model.dart';
import 'package:travel_booking/models/travlog_model.dart';
import 'package:travel_booking/widgets/bottom_navigation_travelkuy.dart';

import '../models/popular_destination_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add((handler(i, list[i])));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
          backgroundColor: mBackgroundColor,
          title: Text(
            "Traveller",
            style: TextStyle(color: Colors.black),
          )
          // Image.asset("assets/traveller.jpg"),
          // SvgPicture.asset("Images/svg/logo.svg"),
          // elevation: 0,
          ),
      backgroundColor: mBackgroundColor,
      bottomNavigationBar: BottomNavigationTravel(),
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            //promo section
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Text(
                'Hi, Shubham Welcome',
                style: mTitleStyle,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: AssetImage(carousels[index].image),
                                  fit: BoxFit.cover)),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? mBlueColor
                                    : mGreyColor),
                          );
                        }),
                      )
                    ],
                  )
                ],
              ),
            ),
            // service section
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Text(
                'Let\'s Book',
                style: mTitleStyle,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 184,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 70,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'Images/svg/service_flight_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      FlightBooking()));
                                        },
                                        child: Text(
                                          "Flight Booking",
                                          style: TextStyle(fontSize: 14,color: Colors.black),
                                          overflow: TextOverflow.ellipsis,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 70,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'Images/svg/service_train_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){},
                                      child: Text(
                                        "Train",
                                        style: mTitleStyle,
                                      ),
                                    ),

                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'Images/svg/service_hotel_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {  },
                                      child: Text(
                                        "Hotel",
                                        style: mTitleStyle,
                                      ),
                                    ),
                                    // Text(
                                    //   "Let's Take A Break",
                                    //   style: mServiceSubtitleStyle,
                                    // )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: mBorderColor, width: 1)),
                          child: Row(
                            children: <Widget>[
                              SvgPicture.asset(
                                'Images/svg/service_car_rental_icon.svg',
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: () {  },
                                      child: Text(
                                        "Car",
                                        style: mTitleStyle,
                                      ),
                                    ),
                                    // Text(
                                    //   "Support",
                                    //   style: mServiceSubtitleStyle,
                                    // ),
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    // popular destination section
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                "Popular Destination !",
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 140,
              child: ListView.builder(
                itemCount: populars.length,
                padding: EdgeInsets.only(left: 16, right: 16),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Container(
                      height: 140,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: mBorderColor, width: 1),
                      ),
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            populars[index].image,
                            height: 74,
                          ),
                          Text(
                            populars[index].name,
                            style: mPopluarDestinationTitleStyle,
                          ),
                          Text(populars[index].country,
                              style: mPopularDestinationSubtitleStyle)
                        ],
                      ),
                    ),
                  );
                },
                // itemCount: populars.length,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                "Travelog!",
                style: mTitleStyle,
              ),
            ),
            Container(
              height: 181,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 16, left: 16),
                    width: 220,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 104,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage(travlogs[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                  "Images/svg/travlog_top_corner.svg"),
                              right: 0,
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                  'Images/svg/travelkuy_logo_white.svg'),
                              right: 8,
                              top: 8,
                            ),
                            Positioned(
                              child: SvgPicture.asset(
                                  'Images/svg/travlog_bottom_gradient.svg'),
                              bottom: 0,
                            ),
                            Positioned(
                              child: Text(
                                'Travelog ' + travlogs[index].name,
                                style: mTravelogTitleStyle,
                              ),
                              bottom: 8,
                              left: 8,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          travlogs[index].content,
                          maxLines: 3,
                          style: mTravelogContentStyle,
                        ),
                        Text(
                          travlogs[index].place,
                          style: mTravelogPlaceStyle,
                        )
                      ],
                    ),
                  );
                },
                itemCount: travlogs.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
