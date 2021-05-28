import 'package:flutter/material.dart';
import 'package:learn1/secondpage.dart';
import 'package:learn1/thirdpage.dart';
import 'firstpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fluttertask',
      initialRoute: '/',
      routes: {
        '/': (context) => Firstpage(),
        '/secondpage': (context) => Secondpage(),
        '/thirdpage': (context) => Thridpage(),
      },
    );
  }
}
