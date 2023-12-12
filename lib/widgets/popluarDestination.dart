import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/color_constant.dart';
import '../constants/style.dart';
import '../models/popular_destination_model.dart';

class popularDestination extends StatelessWidget {
  const popularDestination({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      child: ListView.builder(
        itemCount: populars.length,
        padding: EdgeInsets.only(left: 16, right: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
              // Handle the tap event, you can navigate to a new screen or perform an action
              print('Popular Destination tapped: ${populars[index].name}');
            },
            child: Card(
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
                    Text(
                      populars[index].country,
                      style: mPopularDestinationSubtitleStyle,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
