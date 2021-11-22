import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hamtarot_app/HomePage.dart';
import 'package:hamtarot_app/model/DataFormModel.dart';
import 'package:provider/provider.dart';

class Showdata extends StatefulWidget {
  @override
  _ShowdataState createState() => _ShowdataState();
}

class _ShowdataState extends State<Showdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ผลการจองคิว'),
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
      bottomNavigationBar: SingleChildScrollView(
        child: CurvedNavigationBar(
          color: Color(0xFF6d4c41),
          backgroundColor: Color(0xFFFFF8E1),
          buttonBackgroundColor: Color(0xFF6d4c41),
          height: 50,
          items: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.pop(context, '/3');
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
          index: 4,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(),
            Container(
              child: Text(
                'เรารอพบคุณอยู่',
                style: TextStyle(fontSize: 40, color: Colors.black54),
              ),
            ),
            Container(
              margin: EdgeInsets.all(1.0), //ปรับระยะห่างของรูปกับรอบข้าง
              padding: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),

              // child: Image.asset('assets/Hamtarot.png'),
            ),
            Consumer<DataFormModel>(
              builder: (context, form, child) {
                return Text(
                    'ชื่อ-นามสกุล : ${form.Name} \nหมายเลขโทรศัพท์ : ${form.telnum} \nE-mail : ${form.mail} \nวันเวลาที่นัดหมาย : ${form.resdate}',
                    style: TextStyle(fontSize: 18, color: Colors.blueAccent));
              },
            ),
            Container(
              margin: EdgeInsets.only(
                  left: 50.0,
                  right: 50.0,
                  bottom: 4.0), //ปรับระยะห่างของรูปกับรอบข้าง
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.35), //ปรับสีเส้นขอบ
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Image.asset('assets/book.jpg'), width: 150,
            ),
            Row(
              children: <Widget>[
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/2');
                        },
                        child: Text('จองคิวเพิ่ม'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
