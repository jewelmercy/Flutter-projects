import 'package:flutter/material.dart';
import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter_application_1/checklist.dart';
import 'package:flutter_application_1/components.dart';

class Foodcourt {
  String name;
  List<String> items;
  Foodcourt({required this.name, required this.items});
}

class HomePage extends StatefulWidget {
  final String useremail;
  HomePage({Key? key, required this.useremail}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Foodcourt> foodcourt = [
    Foodcourt(name: "Food Court 1", items: [
      "Check list 1",
      "Check list 2",
      "Check list 3",
    ]),
    Foodcourt(name: "Food Court 2", items: [
      "Check list 4",
      "Check list 5",
      "Check list 6",
    ]),
    Foodcourt(name: "Food Court 3", items: [
      "Check list 7",
      "Check list 8",
      "Check list 9",
    ]),
    Foodcourt(name: "Food Court 4", items: [
      "Check list 10",
      "Check list 11",
      "Check list 12",
    ])
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Text(
              'Logged in User',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Text(
              '${widget.useremail}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
           Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Text(
              'Select Food Court',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: foodcourt.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ButtonBox(
                    name: foodcourt[index].name.toString(),
                    color: Colors.teal.shade800,
                    onpress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Checklistpage(
                                    foodcourt: foodcourt[index].name.toString(),
                                    checklist: foodcourt[index].items.toList(),
                                  )));
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
