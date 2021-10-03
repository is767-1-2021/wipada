import 'package:flutter/material.dart';
import 'package:midterm_app/model.dart';
import 'package:provider/provider.dart';

import 'blankpage.dart';
import 'result.dart';
import 'shake.dart';
import 'thinglist.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Namemodel(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hamtarot App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8E1),
        appBarTheme: AppBarTheme(color: Colors.brown[600]),
      ),
      initialRoute: '/1',
      routes: <String, WidgetBuilder>{
        '/1': (context) => SSHomePage(),
        '/2': (context) => ShakePage(),
        '/3': (context) => ResultPage(),
        '/4': (context) => ThingPage(),
        '/5': (context) => BlankPage(),
      },
    );
  }
}

class SSHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.brightness_4_sharp, size: 30),
            Text(
              'HAMTAROT',
              style: TextStyle(fontSize: 25),
            ),
            Icon(Icons.brightness_4_sharp, size: 30)
          ],
        ),
      ),
      body: GridView.count(
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/2');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.battery_unknown_sharp,
                    size: 50,
                  ),
                  Text(
                    'Shaking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/3');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chrome_reader_mode_rounded,
                    size: 50,
                  ),
                  Text(
                    'Result',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/4');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.category_rounded,
                    size: 50,
                  ),
                  Text(
                    'Temple List',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/5');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.style_rounded, size: 50),
                  Text(
                    'Card',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/5');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.event_rounded,
                    size: 50,
                  ),
                  Text(
                    'Booking',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/5');
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.quiz_rounded,
                    size: 50,
                  ),
                  Text(
                    'Question',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
