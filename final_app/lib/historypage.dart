import 'package:final_app/calcontroller.dart';
import 'package:final_app/calmodel.dart';
import 'package:final_app/calmodelprovider.dart';
import 'package:final_app/calservice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Services? service;
  CalHistoryController? controller;
  List<CalHistory> calhistory = List.empty();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    service = CalHistoryServices();
    controller = CalHistoryController(service!);
    controller!.onSync
        .listen((bool synState) => setState(() => isLoading = synState));
    getcalhistory();
  }

  void getcalhistory() async {
    var newcalhistory = await controller!.fectcalhistory();

    setState(() {
      calhistory = newcalhistory;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
            backgroundColor: Colors.blueGrey[100],
            color: Colors.grey[300],
          ))
        : Scaffold(
            appBar: AppBar(title: Text('History'), actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.delete_forever_sharp)),
            ]),
            body: ListView.builder(
                itemCount: calhistory.length,
                itemBuilder: (BuildContext context, index) {
                  CalHistory newcalhistory = calhistory[index];
                  return ListTile(
                      title: Text(newcalhistory.input1 +
                          newcalhistory.sign +
                          newcalhistory.input2 +
                          "="),
                      subtitle: Text(newcalhistory.result));
                }));
  }
}
