import 'dart:ui';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/Siamese/model.dart';
import 'package:hamtarot_app/Siamese/shake.dart';
import 'package:hamtarot_app/model/ss_model.dart';
import 'package:provider/provider.dart';

class ResultRandom extends StatefulWidget {
   final SS newss;
  const ResultRandom({Key? key, required this.newss}) : super(key: key);

  @override
  _ResultRandomState createState() => _ResultRandomState();
}

bool heart = true;

class _ResultRandomState extends State<ResultRandom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ผลคำทำนาย'), automaticallyImplyLeading: false,
      actions: [
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/1');
                      }, icon: Icon(Icons.home)),
      ]),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.only(top: 15),
                    child: Consumer<Namemodel>(
                      builder: (context, form, child) {
                        return Container(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Text(
                              'คุณ${form.Name}ได้เซียมซีเลขที่${widget.newss.id}',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.black)),
                        );
                      },
                    ),
                  ),
                ),
             
                Container(
                  padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                  width: 300,
                  height: 370,
                  
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${widget.newss.img}'),
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
                              style:
                                  TextStyle(fontSize: 22, color: Colors.black),
                            ),
                            Icon(Icons.brightness_4_sharp)
                          ],
                        ),
                      ),
                      Text(
                        'ใบเซียมซีเลขที่  ${widget.newss.id}  ความว่า',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(widget.newss.content,
                        style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ),

           
                Container(
                  padding: EdgeInsets.only(top: 10, right: 35, left: 260),
                  child: Column(
                    children: [
                      Row(
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
                    ],
                  ),
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.amber[200]),
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
                                content:
                                    Text('ไม่ควรเขย่าเกินอาทิตย์ละ 1 ครั้ง'),
                              );
                            },
                          );
                          await Future.delayed(
                              const Duration(milliseconds: 3000), () {
                            setState(() {});
                          });

                          await Navigator.pushNamed(context, '/6'); //6//
                        },
                        child: Text(
                          'เขย่าอีกครั้ง',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            onPrimary: Colors.black,
                            primary: Colors.amber[200]),
                        onPressed: () {
                          Navigator.pushNamed(context, ('/9')); //9//
                        },
                        child: Text(
                          'ไหว้พระเสริมบุญ',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ))
                  ],
                )),
              ],
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
                onPressed: () {
                  Navigator.pushNamed(context, '/3');
                },
                icon: Icon(Icons.crop_portrait, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/4');
                },
                icon: Icon(Icons.amp_stories_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/5');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/6');
                },
                icon:
                    Icon(Icons.battery_unknown, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                icon: Icon(Icons.date_range_rounded,
                    size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/9');
                },
                icon: Icon(Icons.account_balance_rounded,
                    size: 30, color: Colors.black)),
          ],
          // animationDuration: Duration(milliseconds: 200),
          index: 3,
        ),
      ),
    );
  }
}
