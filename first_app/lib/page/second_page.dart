import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SecondPage'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.build_sharp),
          onPressed: () {},
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'theme data',
              ),
              Table(
                children: [
                  TableRow(children: [
                    Container(
                      child: Center(child: Text('No')),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      child: Center(child: Text('Name')),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    Container(
                      child: Center(child: Text('Gender')),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ]),
                  TableRow(
                    children: [
                      Center(child: Text('1')),
                      Center(child: Text('NV')),
                      Center(child: Text('F')),
                    ],
                  ),
                  TableRow(
                    children: [
                      Center(child: Text('2')),
                      Center(child: Text('KS')),
                      Center(child: Text('F'))
                    ],
                  )
                ],
              )
            ],
          ),
        ));
  }
}