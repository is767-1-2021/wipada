import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Form/email_validator.dart';
import 'package:hamtarot_app/Login/model.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool showProgress = false;
  String? email, password, username;
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _validateemail = false;
  bool _validatepassword = false;
  @override
  void dispose() {
    userNameController.dispose();
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
                "Login Page",
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: userNameController,
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
              Row(
                  children: [
                   ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          passwordController.text.isEmpty
                              ? _validatepassword = true
                              : _validatepassword = false;
                          userNameController.text.isEmpty
                              ? _validateemail = true
                              : _validateemail = false;
                        });
                        if ((_formKey.currentState!.validate())) {
                          _formKey.currentState!.save();
                          context.read<Namemodel>().email = email;
                          try {
                            final newUser = await _auth
                              .signInWithEmailAndPassword(
                                  email: email!, password: password!);
                            print(newUser.toString());
                            await Navigator.pushNamed(context, '/1');
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('email and password incorrect'),
                              ));
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('email and password incorrect'),
                              ));
                            }
                          }
                        }
                      },
                    
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                    ElevatedButton( 
                      onPressed: ()  {
                        Navigator.pushNamed(context, '/13');  
                      },
                     
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20.0),
                      ),
                    ),
                   
                  ],
                ),
            
              
            ],
          ),
        ),
      ),
    );
  }
}
