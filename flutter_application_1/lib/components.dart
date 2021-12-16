import 'package:flutter/material.dart';

class TextFieldbox extends StatelessWidget {
  TextFieldbox(
      {Key? key,
      required this.hinttext,
      required this.obscuretext,
      required this.icon,
      required this.keyboardtype,
      required this.onchange})
      : super(key: key);

  final String hinttext;
  final bool obscuretext;
  final TextInputType keyboardtype;
  final Icon icon;
  final Function(String) onchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15.0),
      child: TextField(
        keyboardType: keyboardtype,
        obscureText: obscuretext,
        decoration: InputDecoration(hintText: hinttext, icon: icon),
        onChanged: onchange,
      ),
    );
  }
}

class ButtonBox extends StatelessWidget {
  final String name;
  final Color color;
  final Function() onpress;
  ButtonBox({required this.name, required this.color, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      child:
          Container(width: 300, height: 40, child: Center(child: Text(name,style: TextStyle(fontSize: 15)))),
      style: ElevatedButton.styleFrom(
        primary: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

void snackbar(BuildContext context, String title, int duration) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: 0.4,
      duration: Duration(milliseconds: duration),
      backgroundColor: Colors.teal,
      content: Text(title,
          style: TextStyle(
              fontFamily: 'Play', fontSize: 15, color: Colors.black))));
}
