import 'dart:core';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';
import 'package:flutter_application_1/firebase.dart';
import 'package:flutter_application_1/homepage.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String _email = '';
  String _password = '';
  FireBaselog firebase = FireBaselog();
  late FirebaseAuth _auth;

  Future<FirebaseApp> _initializeFirebase() async {
    //Initializing app to firebase
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    //Authentication with firebase
    _auth = FirebaseAuth.instanceFor(app: firebaseApp);

    //if user is already signed in get the user information
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      //if user exists go to home page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomePage(
                  useremail: user.email.toString(),
                )),
      );
    }
    return firebaseApp;
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    if (email == "" || password == "") {
      snackbar(context, "Email or password cannot be empty", 500);
      return;
    }

    //sign in using email and password
    User? user = await firebase.signInUsingEmailPassword(
      context: context,
      email: email,
      password: password,
    );
    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(
            useremail: user.displayName.toString(),
          ),
        ),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
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
                          color: Colors.teal,
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
                                onpress: () {
                                  login(context, _email, _password);
                                },
                                color: Colors.teal.shade400,
                                name: 'LOGIN',
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
            );
          }
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.teal)),
            ),
          );
        },
      ),
    );
  }
}
