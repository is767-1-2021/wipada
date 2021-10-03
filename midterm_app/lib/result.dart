import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:midterm_app/model.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final number = Random().nextInt(4) + 1;
  bool heart = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ผลคำทำนาย'), actions: [
        IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/1');
            },
            icon: Icon(Icons.home)),
      ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 15),
                child: Consumer<Namemodel>(
                  builder: (context, form, child) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Text('คุณ${form.Name}ได้เซียมซีเลขที่$number',
                          style: TextStyle(fontSize: 30, color: Colors.black)),
                    );
                  },
                ),
              ),
            ),
            number == 1
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/H1.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          'เลขที่$number GOOD',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 2
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/S1.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          'เลขที่$number BAD',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 3
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/S2.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          'เลขที่$number BAD',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            number == 4
                ? Container(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    width: 300,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/H2.png'),
                            fit: BoxFit.fill)),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.brightness_4_sharp),
                              Text(
                                'เซียมซีวัดแฮมทาโร่',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              Icon(Icons.brightness_4_sharp)
                            ],
                          ),
                        ),
                        Text(
                          'เลขที่$number GOOD',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  )
                : SizedBox(),
            Container(
              padding: EdgeInsets.only(right: 35, left: 260),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      icon: heart
                          ? Icon(
                              Icons.favorite,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.favorite,
                              color: Colors.pink[200],
                            ),
                      onPressed: () {
                        setState(() {
                          heart = !heart;
                        });
                      }),
                  Icon(Icons.save_alt_rounded)
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.black, primary: Colors.amber[200]),
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Center(
                                child: Row(
                              children: [
                                Text(
                                  'คำเตือน',
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                Icon(Icons.error_outline_rounded,
                                    color: Colors.pink, size: 20),
                              ],
                            )),
                            content: Text('ไม่ควรเขย่าเกินอาทิตย์ละ 1 ครั้ง'),
                          );
                        },
                      );
                      await Future.delayed(const Duration(milliseconds: 3000),
                          () {
                        setState(() {});
                      });

                      await Navigator.pushNamed(context, '/2');
                    },
                    child: Text(
                      'เขย่าอีกครั้ง',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.black, primary: Colors.amber[200]),
                      onPressed: () {
                        Navigator.pushNamed(context, ('/4'));
                      },
                      child: Text(
                        'วัดดังเสริมดวง',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41),
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_1_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.filter_3_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.battery_unknown, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.date_range_rounded,
                    size: 30, color: Colors.black)),
          ],
          index: 3,
        ),
      ),
    );
  }
}
