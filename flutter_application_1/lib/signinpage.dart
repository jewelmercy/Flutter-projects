import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';
import 'package:flutter_application_1/homepage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';

  void login(BuildContext context ,String email, String password) {
    SnackBar(content: Text("Email or password cannot be empty"));
    if (email == "" || password == "") {
      snackbar(context,"Email or password cannot be empty",500);
      return;
    }
    
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => HomePage(
          useremail: _email,
        ),
      ),
      ModalRoute.withName('/'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey,
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: Colors.teal)),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color:Colors.teal ,
                 height: 450,
                  width: 900,
                ),
                Container(
                  padding: EdgeInsets.all(45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFieldbox(
                        hinttext: 'Username',
                        obscuretext: false,
                        keyboardtype: TextInputType.emailAddress,
                        icon: Icon(Icons.person_outline),
                        onchange: (value) {
                          _email = value;
                        },
                      ),
                      TextFieldbox(
                        hinttext: 'Password',
                        onchange: (value) {
                          _password = value;
                        },
                        obscuretext: true,
                        keyboardtype: TextInputType.number,
                        icon: Icon(Icons.lock_outline),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ButtonBox(
                        onpress:() {
                          login(context,_email, _password);
                        }, color: Colors.teal.shade400, name: 'LOGIN',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            Text(
                              'Dont have an account?',
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/signup');
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: Colors.teal.shade400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Text('Welcome',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
