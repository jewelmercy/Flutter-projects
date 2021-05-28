import 'package:flutter/material.dart';
import 'package:learn1/secondpage.dart';
import 'screensize.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Firstpage extends StatefulWidget {
  @override
  _FirstpageState createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage>
    with SingleTickerProviderStateMixin {
  // ignore: unused_field
  String _countrycode;
  String phonenumber;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.repeat();
      }
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeWidth;
    double height = SizeConfig.blockSizeHeight;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width * 100,
          height: height * 100,
          decoration: BoxDecoration(
            // color: Color(0xff605D5D),
            gradient: LinearGradient(colors: [
              Colors.blue.shade700,
              Colors.blue,
              Colors.blue.shade300,
              Colors.blue.shade300,
              Colors.blue.shade300,
              Colors.blue.shade300,
              Colors.blue.shade50,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: FadeTransition(
                  opacity: controller,
                  child: Image(
                      color: Colors.white,
                      image: AssetImage('assets/images/shop.png')),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(width * 7.77),
                      topRight: Radius.circular(width * 7.77)),
                ),
                width: width * 100,
                height: height * 55,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 4,
                    ),

                    SizedBox(
                      height: height * 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CountryCodePicker(
                            //padding: EdgeInsets.only(left: width * 2, right: width * 2),
                            dialogSize: Size(width * 80, height * 50),
                            flagWidth: width * 8,
                            showFlagDialog: true,
                            boxDecoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(width * 5)),
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Play',
                                fontWeight: FontWeight.normal,
                                fontSize: width * 5),
                            searchStyle: TextStyle(
                                fontFamily: 'Play', fontSize: width * 5),
                            searchDecoration:
                                InputDecoration(hintText: 'Type here'),
                            dialogTextStyle: TextStyle(
                                fontFamily: 'Play',
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: width * 5),
                            onChanged: (countrycode) {
                              _countrycode = countrycode.toString();
                            },
                            initialSelection: '+91',
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            showFlag: true,
                            alignLeft: false,
                            closeIcon: Icon(
                              Icons.close,
                              size: width * 5,
                              color: Colors.black,
                            )),
                        Container(
                          width: width * 34,
                          child: TextField(
                            onChanged: (String value) {
                              phonenumber = value;
                            },
                            obscureText: false,
                            cursorColor: Color(0xff41444b),
                            keyboardType: TextInputType.phone,
                            style: TextStyle(
                                fontFamily: 'Play',
                                fontWeight: FontWeight.bold,
                                color: Color(0xff41444b),
                                fontSize: width * 5),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(width * 2.0,
                                  width * 1.0, width * 1.0, width * 1.0),
                              hintText: "8888888888",
                              hintStyle: TextStyle(
                                  fontFamily: 'Play',
                                  color: Color(0xff41444b).withOpacity(0.8),
                                  fontWeight: FontWeight.normal,
                                  fontSize: width * 5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 4,
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Secondpage(phonenumber: phonenumber)));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 10)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue,
                                  Colors.blue.shade300,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(width * 10)),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: width * 55, minHeight: height * 6),
                          alignment: Alignment.center,
                          child: Text(
                            "Signup using OTP",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Play',
                                fontSize: width * 5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 5,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                          fontFamily: 'Play',
                          color: Colors.black,
                          fontSize: width * 4,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      color: Colors.white,
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(width * 10)),
                      padding: EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blue.shade700,
                                  Colors.blue,
                                  Colors.blue.shade300,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                            borderRadius: BorderRadius.circular(width * 10)),
                        child: Container(
                          constraints: BoxConstraints(
                              maxWidth: width * 55, minHeight: height * 6),
                          alignment: Alignment.center,
                          child: Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Play',
                                fontSize: width * 5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
