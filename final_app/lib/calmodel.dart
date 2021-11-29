import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class CalHistory {
  final String input1;
  final String input2;
  final String sign;
  final String result;
  final Timestamp historydate;

  CalHistory(
      this.input1, this.input2, this.sign, this.result, this.historydate);

  factory CalHistory.fromJson(
    Map<String, dynamic> json,
  ) {
    return CalHistory(
      json['input1'] as String,
      json['input2'] as String,
      json['sign'] as String,
      json['result'] as String,
      json['historydate'] as Timestamp,
    );
  }
}

class AllCalHistory {
  final List<CalHistory> calhistory;
  AllCalHistory(this.calhistory);

  factory AllCalHistory.fromJson(List<dynamic> json) {
    List<CalHistory> calhistory;

    calhistory = json.map((index) => CalHistory.fromJson(index)).toList();
    return AllCalHistory(calhistory);
  }

  factory AllCalHistory.fromSnapshot(QuerySnapshot s) {
    List<CalHistory> calhistory = s.docs.map((DocumentSnapshot ds) {
      return CalHistory.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllCalHistory(calhistory);
  }
}
