// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:payment_app/utills/theme.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = -1;
  Widget option(int index, String periode, String desc, String price) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(top: 20, bottom: 5, right: 20, left: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selectedIndex == index ? blueColor : greyBorder,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                selectedIndex == index
                    ? Image.asset(
                        'assets/check.png',
                        width: 18,
                        height: 18,
                      )
                    : Image.asset(
                        'assets/uncheck.png',
                        width: 18,
                        height: 18,
                      ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      periode,
                      style: planText,
                    ),
                    Text(
                      desc,
                      style: descText,
                    )
                  ],
                ),
                SizedBox(
                  width: 91,
                ),
                Text(
                  price,
                  style: priceText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //Widget Header
    Widget header() {
      return Padding(
        padding: EdgeInsets.only(
          top: 50.0,
          right: 32.0,
          left: 32.0,
        ),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/image_goal.png',
                width: 217,
                height: 150,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Upgrade To', style: title),
                SizedBox(
                  width: 6,
                ),
                Text(
                  'Pro',
                  style: title.copyWith(color: blueColor),
                )
              ],
            ),
            SizedBox(height: 16),
            Text(
              'Go unlock all features and\nbuild your own business bigger',
              style: subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    Widget button() {
      return Column(
        children: [
          SizedBox(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: blueColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {
                Fluttertoast.showToast(
                  msg: 'Added to Chart',
                  toastLength: Toast.LENGTH_SHORT,
                  backgroundColor: whiteColor,
                  textColor: Colors.black
                );
              },
              child: Text(
                'Checkout Now',
                style: btnText,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        backgroundColor: navyColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                header(),
                SizedBox(height: 30),
                option(0, 'Monthly', 'Good for starting up', '\$20'),
                option(1, 'Quarterly', 'Focusing on building', '\$55'),
                option(2, 'Yearly', 'Steady company', '\$220'),
                SizedBox(height: 50),
                selectedIndex == -1 ? SizedBox() : button(),
                SizedBox(height: 50)
              ],
            ),
          ),
        ));
  }
}
