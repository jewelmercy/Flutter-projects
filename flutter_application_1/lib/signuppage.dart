import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';
import 'package:flutter_application_1/firebase.dart';
import 'package:flutter_application_1/homepage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkbox = false;
   String _email = '';
  String _password = '';
  String _name ="";
  FireBaselog firebase = FireBaselog();

  Future<void> register(BuildContext context, String email,String name, String password) async {
    // setState(() {
    //   _isProcessing = true;
    // });

 if (email == "" || password == "" || name == "") {
      snackbar(context, "Email or password cannot be empty", 500);
      return;
    }

//register new user using name, email and password and add to the firebase
    User? user = await firebase.registerUsingEmailPassword(
      context: context,
      name: name,
      email: email,
      password: password,
    );


    if (user != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (context) => HomePage(
            useremail: user.email.toString(),
          ),
        ),
        ModalRoute.withName('/'),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
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
                children: [
                  Container(
                    child: Image(
                      height: 280,
                      width: 900,
                      color: Colors.teal,
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/welcome.png'),
                      //width: 150,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(45),
                    child: Column(
                      children: [
                        TextFieldbox(
                          hinttext: 'Username',
                          obscuretext: false,
                          keyboardtype: TextInputType.text,
                          icon: Icon(Icons.person_outline),
                          onchange: (value) {
                            _name= value;
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
                        TextFieldbox(
                          hinttext: 'Email',
                          onchange: (value) {
                            _email = value;
                          },
                          obscuretext: false,
                          keyboardtype: TextInputType.emailAddress,
                          icon: Icon(Icons.email_outlined),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 38.0),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.teal,
                          value: checkbox,
                          onChanged: (value) {
                            setState(() {
                              checkbox = value!;
                            });
                          },
                        ),
                        Text(
                          'I have accepted the',
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            'Terms & Conditions',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationThickness: 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      register(context,_email,_name, _password);
                    },
                    child: Container(
                        width: 300,
                        height: 40,
                        child: Center(child: Text('SIGN UP'))),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 50,
                left: 20,
                child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Positioned(
                  top: 200,
                  left: 20,
                  child: Text('Create New Account',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
