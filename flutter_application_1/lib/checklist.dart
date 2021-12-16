import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';

class Checklistpage extends StatefulWidget {
  final String foodcourt;
  final List<String> checklist;
  Checklistpage({Key? key, required this.foodcourt, required this.checklist})
      : super(key: key);

  @override
  _ChecklistpageState createState() => _ChecklistpageState();
}

class _ChecklistpageState extends State<Checklistpage> {
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
              'Selected Food Court',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Text(
              '${widget.foodcourt}',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 50.0, left: 15, right: 15),
            child: Text(
              'Selected Check List',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.checklist.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Container(
                        width: 300,
                        height: 40,
                        child: Center(
                            child: Text(widget.checklist[index].toString()))),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: ButtonBox(
              onpress: () {
                Navigator.pop(context);
              },
              color: Colors.cyan,
              name: 'Select another food court',
            ),
          ),
        ],
      ),
    );
  }
}
