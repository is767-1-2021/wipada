import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/model/card_model.dart';

class CardResult extends StatefulWidget {
  final Card1 newcard;
  const CardResult({Key? key, required this.newcard}) : super(key: key);

  @override
  _CardResultState createState() => _CardResultState();
}

class _CardResultState extends State<CardResult> {
/* static var listImagesnotFound = [
    "assets/card_result-1.png",
    "assets/card_result-2.png",
    "assets/card_result-3.png"
    ];
  static var _random = Random();
  var imageToShow =
      listImagesnotFound[_random.nextInt(listImagesnotFound.length)]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ทำนาย'),
        automaticallyImplyLeading: false,
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                    left: 50.0, right: 50.0, bottom: 4.0, top: 10.0),
                alignment: Alignment.center,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Column(
                    children: [
                      Container(
                        child: Image.network(widget.newcard.img,
                            fit: BoxFit.cover),
                      ),
                      Container(
                        child: Text(
                          'คุณได้ไพ่${widget.newcard.card}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        child: Text(widget.newcard.content),
                      ),
                    ],
                  ),
                  back: Column(
                    children: [
                      Container(
                        child: Text('การงาน',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                          widget.newcard.work,
                          style: TextStyle(fontSize: 14.0, height: 1.5),
                        ),
                      ),
                      Container(
                        child: Text('การเงิน',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                          widget.newcard.money,
                          style: TextStyle(fontSize: 14.0, height: 2.0),
                        ),
                      ),
                      Container(
                        child: Text('ความรัก',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        child: Text(
                          widget.newcard.love,
                          style: TextStyle(fontSize: 14.0, height: 1.5),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Center(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/3');
                  },
                  child: Text('ทำนายอีกครั้ง'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/9');
                  },
                  child: Text('ไหว้พระเสริมบุญ'),
                ),
              ],
            ),
            //),
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
                  Navigator.pushNamed(context, '/3');
                },
                icon: Icon(Icons.quiz, size: 30, color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/5');
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
          //  animationDuration: Duration(milliseconds: 200),
          index: 0,
        ),
      ),
      /*floatingActionButton: FloatingActionButton.extended(
          elevation: 2.0,
          icon: const Icon(Icons.refresh),
          label: const Text('ทำนายอีกครั้ง'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MyAppCard1(
                    //title: '',
                    ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat*/
    );
  }
}
