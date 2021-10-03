import 'package:flutter/material.dart';

class Thingmenu {
  String name;
  String detail;
  String image;

  Thingmenu(this.name, this.detail, this.image);
}

class ThingPage extends StatefulWidget {
  @override
  _ThingPageState createState() => _ThingPageState();
}

class _ThingPageState extends State<ThingPage> {
  List<Thingmenu> menu = [
    Thingmenu('วัดแขก', 'เสริมดวงความรัก', 'assets/temp1.jpg'),
    Thingmenu('วัดวัดเล่งเน่ยยี่', 'เสริมดวงการเรียน', 'assets/temp2.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('รวมรายชื่อวัดดังเสริมดวง'), actions: [
        IconButton(onPressed: () {Navigator.pushNamed(context, '/1');}, icon: Icon(Icons.home)),
      ]),
      body: ListView.builder(
          itemCount: menu.length,
          itemBuilder: (BuildContext context, int index) {
            Thingmenu thing = menu[index];
            return ListTile(
              title: Text(thing.name),
              subtitle: Text(thing.detail),
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 55,
                  maxHeight: 55,
                ),
                child: Image.asset(thing.image, fit: BoxFit.cover),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ThingDetail(thing: thing)));
              },
            );
          }),
    );
  }
}

class ThingDetail extends StatelessWidget {
  final Thingmenu thing;
  const ThingDetail({Key? key, required this.thing}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(padding: EdgeInsets.only(top: 20),
            child: Text(thing.name,style: TextStyle(
                            fontSize: 24),)),
          Center(
            child: Image.asset(
              thing.image,
              width: 300,
              height: 400,
            ),
          ),
          Text('รายละเอียดวัด : xxxxxxxxxxxxxxxxxx'),
          Container(padding: EdgeInsets.only(top: 20),
              child: ElevatedButton( 
                  onPressed: () {}, style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.amber)),
                  child: Text('ขอทราบเส้นทาง',style: TextStyle(color: Colors.black),)))
        ],
      ),
    );
  }
}
