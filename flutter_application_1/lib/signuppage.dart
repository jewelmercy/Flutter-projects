import 'package:flutter/material.dart';
import 'package:flutter_application_1/components.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool checkbox = false;

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
                            print(value);
                          },
                        ),
                        TextFieldbox(
                          hinttext: 'Password',
                          onchange: (value) {
                            print(value);
                          },
                          obscuretext: true,
                          keyboardtype: TextInputType.number,
                          icon: Icon(Icons.lock_outline),
                        ),
                        TextFieldbox(
                          hinttext: 'Email',
                          onchange: (value) {
                            print(value);
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
