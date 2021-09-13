import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 3,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cloud),
              ),
              Tab(
                icon: Icon(Icons.beach_access_outlined),
              ),
              Tab(
                icon: Icon(Icons.brightness_1_outlined),
              ),
              Tab(
                icon: Icon(Icons.ice_skating),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Text('Cloud'),
            ),
            Center(
              child: Text('Umbrella'),
            ),
            Center(
              child: Text('Sunny'),
            ),
            Center(
              child: Text('Skate'),
            ),
          ],
        ),
      ),
    );
  }
}