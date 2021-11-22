import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hamtarot_app/Card/card1.dart';
import 'package:hamtarot_app/Card/taro1.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Login/email_sign_in.dart';
import 'package:hamtarot_app/Login/login.dart';
import 'package:hamtarot_app/Login/model.dart';
import 'package:hamtarot_app/Login/signup.dart';
import 'package:hamtarot_app/Page/Form.dart';
import 'package:hamtarot_app/Page/form_show.dart';
import 'package:hamtarot_app/Question/question_form_model.dart';
import 'package:hamtarot_app/Question/question_page.dart';
import 'package:hamtarot_app/Siamese/ListView.dart';
import 'package:hamtarot_app/Siamese/shake.dart';
import 'package:provider/provider.dart';
import 'model/DataFormModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataFormModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loginmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => Loginmodel(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuestionFormmodel(),
        ),
        ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
      ],
      child: MyAppHamtarot(),
    ),
  );
}

class MyAppHamtarot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.brown[600],
          primarySwatch: Colors.amber,
          accentColor: Colors.red,
          scaffoldBackgroundColor: const Color(0xFFFFF8E1),
          textTheme: GoogleFonts.promptTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        initialRoute: '/11',
        routes: <String, WidgetBuilder>{
          '/11': (context) => Login(),
          '/1': (context) => MyHomePage(),
          '/2': (context) => FormPage(), //form
          '/7': (context) => Showdata(), //form
          '/3': (context) => MyAppCard1(), //card1
          '/4': (context) => MyAppCard3(), //card3
          '/5': (context) => QuestionPage(), //question
          '/6': (context) => ShakePage(), //siamese
          '/9': (context) => ThingView(), //temple
          '/13': (context) => Signup(),
        });
  }
}
