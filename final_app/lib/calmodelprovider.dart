import 'package:final_app/calcontroller.dart';
import 'package:final_app/calmodel.dart';
import 'package:final_app/calservice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalHistoryProvider extends ChangeNotifier {
  // String? answerTemp;
  String? inputFull;
  String? operator;
  String? answer;
  String? ans;

  // Services? service;
  // CalHistoryController? controller;
  // List<CalHistory> calhistory = List.empty();

  get InputFull => this.inputFull;

  set InputFull(value) {
    this.inputFull = value;
    notifyListeners();
  }

  get Answer => this.answer;

  set Answer(value) {
    this.answer = value;

    notifyListeners();
  }

  // get AnswerTemp => this.answerTemp;

  // set AnswerTemp(value) {
  //   this.answerTemp = value;
  //   notifyListeners();
  // }

  get Operator => this.operator;

  set Operator(value) {
    this.operator = value;
    notifyListeners();
  }

  get Ans => this.ans;

  set Ans(value) {
    this.ans = value;
    FirebaseFirestore.instance.collection('history').add(
      {
        'input1': inputFull,
        'input2': answer,
        'sign': operator,
        'result': ans,
        'historydate': Timestamp.now()
      },
    );
  }

  notifyListeners();
}
  // void addcalhistorys(String inputFull, String answer, String operator, String ans){
  //   controller!.addcalhistory(inputFull, answer, operator, ans);}
 
  //   notifyListeners();
  


  
