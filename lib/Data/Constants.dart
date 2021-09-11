import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Constants {
  // colors
  static const primary = Colors.green;
  static final secondary = Colors.green[800];
  static const buttontxt = Colors.white;
  static const textLink = Colors.blueAccent;
  static const ErrorText = Colors.red;
  static const on = Colors.green;
  static const AlertText = Colors.redAccent;
  static const AppbarText = Colors.white;
  static const BottomNavbar = Colors.white;
  static const CardColor = Colors.white;
  static const black = Colors.black;
  static const splashColor = Colors.grey;
  static const splashScreenColor = Colors.green;

  //Styles
  static const Style = TextStyle(
      color: Constants.AppbarText, fontWeight: FontWeight.bold, fontSize: 25.0);
  static const CardHeadingStyle = TextStyle(
      color: Constants.primary, fontWeight: FontWeight.bold, fontSize: 20.0);
  static const WelcomeHeaderStyle = TextStyle(
      color: Constants.AppbarText, fontSize: 25.0, fontWeight: FontWeight.bold);
  static const CalendarStyle = TextStyle(
      color: Constants.primary, fontSize: 20.0, fontWeight: FontWeight.bold);

  //Linear Gradient
  static LinearGradient get MainGradient {
    return LinearGradient(
      colors: [
        Color.fromRGBO(21, 101, 192, 1),
        Color.fromRGBO(33, 150, 243, 1),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0, 1],
    );
  }

  static Container get ImageCover {
    return Container(
      child: const Image(
        image: AssetImage("assets/images/truckss.webp"),
        fit: BoxFit.cover,
      ),
    );
  }

  static Widget customLoader() {
    return CircularProgressIndicator(strokeWidth: 5,color: Colors.green,);
  }
}
