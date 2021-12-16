import 'package:flutter/material.dart';
import 'package:flutter_application_1/signinpage.dart';
import 'package:flutter_application_1/signuppage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter task', 
      initialRoute: '/',  
      routes: {
        '/': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(), 
      }, 
    );
  }
}
