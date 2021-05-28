import 'package:flutter/material.dart';
import 'package:learn1/thirdpage.dart';
import 'package:otp_screen/otp_screen.dart';

class Secondpage extends StatefulWidget {
  final String phonenumber;
  Secondpage({this.phonenumber});
  @override
  _SecondpageState createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  String phonenumber;

  Future<String> validateOTP(String otp) async {
    await Future.delayed(Duration(milliseconds: 200));
    if (otp == "12345") {
      return null;
    } else {
      return "Please enter valid OTP";
    }
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Thridpage(),
      transitionDuration: Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var curve = Curves.easeInCirc;
        var curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );
        return FadeTransition(
          opacity: curvedAnimation,
          child: child,
        );
      },
    );
  }

  void nextscreen(context) {
    Navigator.of(context).push(_createRoute());
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      phonenumber =
          widget.phonenumber == null ? "8888888888" : widget.phonenumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpScreen(
        otpLength: 5,
        validateOtp: validateOTP,
        routeCallback: nextscreen,
        themeColor: Colors.blue,
        titleColor: Colors.blue,
        keyboardBackgroundColor: Colors.blue.shade700,
        title: " ",
        subTitle: "Please enter the OTP sent to $phonenumber",
        icon: Image.asset(
          'assets/images/smartphone.png',
          fit: BoxFit.fill,
          color: Colors.blue,
        ),
      ),
    );
  }
}
