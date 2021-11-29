import 'package:final_app/calmodel.dart';
import 'package:final_app/calmodelprovider.dart';
import 'package:final_app/calpage.dart';
import 'package:final_app/historypage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CalHistoryProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => CalHistoryModel(),
        // ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey[400],
        accentColor: Colors.blueGrey,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/1': (context) => CalculatorPage(),
        '/2': (context) => HistoryPage(),
      },
    );
  }
}
