import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/controller/temple_controller.dart';
import 'package:hamtarot_app/model/temple_model.dart';
import 'package:hamtarot_app/service/temple_service.dart';

// class Thingmenu {
//   String name;
//   String detail;
//   String image;

//   Thingmenu(this.name, this.detail, this.image);
// }

class ThingView extends StatefulWidget {
  @override
  _ThingViewState createState() => _ThingViewState();
}

class _ThingViewState extends State<ThingView> {
  Services? service;
  TempleController? controller;
  List<Temple> temple = List.empty();

  // List<Thingmenu> menu = [
  //   Thingmenu('วัดแขก', 'เสริมดวงความรัก', 'assets/temp1.jpg'),
  //   Thingmenu('วัดเล่งเน่ยยี่', 'เสริมดวงการเรียน', 'assets/temp2.jpg')
  // ];
  @override
  void initState() {
    super.initState();
    service = TempleServices();
    controller = TempleController(service!);
    gettemple();
  }

  void gettemple() async {
    var newtemple = await controller!.Fecttemple();

    setState(() {
      temple = newtemple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('รวมวัดดังเสริมดวง'),
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
          ]),
      body: ListView.builder(
          itemCount: temple.length,
          itemBuilder: (BuildContext context, index) {
            Temple newtemple = temple[index];
            return ListTile(
              title: Text(newtemple.title),
              subtitle: Text(newtemple.content),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 55,
                  maxHeight: 55,
                ),
                child: Image.network(newtemple.image, fit: BoxFit.cover),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ThingDetail(newtemple: newtemple)));
              },
            );
          }),
      bottomNavigationBar: SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41),
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {
                  gettemple();
                  // Navigator.pushNamed(context, '/3');
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
          //  animationDuration: Duration(milliseconds: 200),
          index: 5,
        ),
      ),
    );
  }
}

class ThingDetail extends StatelessWidget {
  final Temple newtemple;
  const ThingDetail({Key? key, required this.newtemple}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('รายละเอียดวัด'),
        //automaticallyImplyLeading: false,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  newtemple.title,
                  style: TextStyle(fontSize: 24),
                )),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Image.network(
                newtemple.image,
                width: 300,
                height: 200,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: Text(newtemple.detail)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Row(
                      children: [
                        Icon(Icons.access_time),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'เวลาเปิด-ปิดให้เข้าชม :  ${newtemple.time}')),
                      ],
                    )),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Row(
                      children: [
                        Icon(Icons.location_pin),
                        Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                                'พิกัดเส้นทาง :  ${newtemple.time}')),
                      ],
                    )),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Container(
            //         padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            //         child: Row(
            //           children: [
            //             Icon(Icons.location_pin),
            //           ],
            //         )),
            //     Container(
            //         padding: EdgeInsets.only(left: 10),
            //         child: Text('พิกัดเส้นทาง :  ${newtemple.time}')),
            //   ],
            // ),
            // Container(
            //     padding: EdgeInsets.only(top: 20),
            //     child: ElevatedButton(
            //         onPressed: () {},
            //         style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateProperty.all<Color>(Colors.amber)),
            //         child: Text(
            //           'ขอทราบเส้นทาง',
            //           style: TextStyle(color: Colors.black),
            //         )))
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
          //animationDuration: Duration(milliseconds: 200),
          index: 5,
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
