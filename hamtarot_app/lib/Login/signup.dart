import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Login/model.dart';
import 'package:provider/provider.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String? email, password, username;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateemail = false;
  bool _validatepassword = false;
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Firebase Authentication"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Register Page",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: emailController,
                  textAlign: TextAlign.center,
                  onChanged: (value) {
                    email = value;
                  }, // get value from TextField
                  decoration: InputDecoration(
                      hintText: "Enter your Email",
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(32.0))),
                      errorText: _validateemail ? 'email ' : null)),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                controller: passwordController,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value; //get value from textField
                },
                decoration: InputDecoration(
                    hintText: "Enter your Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0))),
                    errorText: _validatepassword ? 'password' : null),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                elevation: 5,
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(32.0),
                child: Row(
                  children: [
                    MaterialButton(
                      onPressed: () async {
                        setState(() {
                          passwordController.text.isEmpty
                              ? _validatepassword = true
                              : _validatepassword = false;
                          emailController.text.isEmpty
                              ? _validateemail = true
                              : _validateemail = false;
                        });
                        if ((_formKey.currentState!.validate())) {
                          _formKey.currentState!.save();
                          context.read<Namemodel>().email = email;

                          try {
                            final newUser = await _auth
                              ..createUserWithEmailAndPassword(
                                  email: email!, password: password!);
                            print(newUser.toString());
                            await Navigator.pushNamed(context, '/1');
                          } catch (e) {}
                        }
                      },
                      minWidth: 200.0,
                      height: 45.0,
                      child: Text(
                        "Singup",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
