import 'dart:math';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:hamtarot_app/Card/Card_Result.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/Services/card_service.dart';
import 'package:hamtarot_app/controller/card_controller.dart';
import 'package:hamtarot_app/model/card_model.dart';

class MyAppCard1 extends StatefulWidget {
  @override
  _MyAppCard1State createState() => _MyAppCard1State();
}

class _MyAppCard1State extends State<MyAppCard1> {
  get body => null;
  TabBar get _tabBar => TabBar(
        tabs: [
          Tab(text: 'ความรัก', icon: Icon(Icons.favorite)),
          Tab(text: 'การงาน', icon: Icon(Icons.accessibility)),
          Tab(text: 'การเงิน', icon: Icon(Icons.account_balance)),
        ],
      );

  Services? service;
  CardController? controller;
  List<Card1> card = List.empty();
  int randomIndex = Random().nextInt(10);

  @override
  void initState() {
    super.initState();

    service = CardServices();
    controller = CardController(service!);
  }

  void getcard() async {
    var newcard = await controller!.Fectcard();

    setState(() {
      card = newcard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      //   initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ทำนายทายทัก'),
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: ColoredBox(
              color: Colors.brown,
              child: _tabBar,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ),
                  );
                },
                icon: Icon(Icons.home)),
          ],
        ),
        body: Stack(
          children: <Widget>[
            Text('คลิกที่ไพ่เพื่อทำนาย',
                style: TextStyle(
                  height: 2.0,
                  fontSize: 20.0,
                )),
            Container(
              height: 500.0,
              child: Stack(children: <Widget>[
                Positioned(
                  top: 50.0,
                  left: 5.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 1000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 30.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 1000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 60.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 1000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 90.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 1000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 120.0,
                  child: InkWell(
                      onTap: () async {
                        getcard();
                        setState(() {});
                        await Future.delayed(
                            const Duration(milliseconds: 1000));
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              Card1 newcard = card[randomIndex];
                              return AlertDialog(
                                content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                                contentPadding: EdgeInsets.all(30),
                                actions: <Widget>[
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => CardResult(
                                                newcard: newcard,
                                              ),
                                            ));
                                      },
                                      child: Center(child: Text('ดูคำทำนาย'))),
                                ],
                              );
                            });
                      },
                      child: Image(
                        image: AssetImage('assets/card_back.png'),
                        fit: BoxFit.cover,
                        width: 200.0,
                        height: 300.0,
                      )),
                ),
                Positioned(
                  top: 50.0,
                  left: 150.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 2000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
                Positioned(
                  top: 50.0,
                  left: 180.0,
                  child: InkWell(
                    onTap: () async {
                      getcard();
                      setState(() {});
                      await Future.delayed(const Duration(milliseconds: 1000));
                      await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            Card1 newcard = card[randomIndex];
                            return AlertDialog(
                              content: Text('คุณได้ไพ่ใบที่${newcard.id}'),
                              contentPadding: EdgeInsets.all(30),
                              actions: <Widget>[
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => CardResult(
                                              newcard: newcard,
                                            ),
                                          ));
                                    },
                                    child: Center(child: Text('ดูคำทำนาย'))),
                              ],
                            );
                          });
                    },
                    child: Image(
                      image: AssetImage('assets/card_back.png'),
                      fit: BoxFit.cover,
                      width: 200.0,
                      height: 300.0,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
        /*   floatingActionButton: FloatingActionButton( 
         onPressed: ()  async {
           getcard(); await showDialog(
              context: context,
              builder: (BuildContext context) {
              Card1 newcard = card [randomIndex];
              return AlertDialog( 
                  content:
                  Text('คุณได้ไพ่ใบที่${newcard.id}'),
                    contentPadding: EdgeInsets.all(30),
                    actions: <Widget>[
                      ElevatedButton(
                       onPressed: () {
                         Navigator.push(
                            context,MaterialPageRoute(
                              builder: (context) => CardResult(newcard: newcard,)
                            ),
                         );
                       }, 
                       child: Center(child: Text('ดูคำทำนาย'))
                      ),
                   ],
                );
              }
           );S
          },
         child: Text('ทำนาย'),
        ),    */
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
                  icon:
                      Icon(Icons.crop_portrait, size: 30, color: Colors.black)),
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
                  icon: Icon(Icons.battery_unknown,
                      size: 30, color: Colors.black)),
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
            index: 0,
          ),
        ),
      ),
    );
  }
}
