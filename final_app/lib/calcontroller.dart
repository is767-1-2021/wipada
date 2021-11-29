import 'dart:async';

import 'package:final_app/calmodel.dart';
import 'package:final_app/calmodelprovider.dart';
import 'package:final_app/calservice.dart';

class CalHistoryController {
  final Services service;
  List<CalHistory> calhistory = List.empty();

  StreamController<bool> onSyncController =
      StreamController(); // checking status stream onsync (on process / finish)
  Stream<bool> get onSync => onSyncController.stream;

  CalHistoryController(this.service);

  Future<List<CalHistory>> fectcalhistory() async {
    onSyncController.add(true); // stream connected
    calhistory = await service.getcalhistory();
    onSyncController.add(false); // stop connected
    return calhistory;
  }

  // void addcalhistory( String inputFull, String answer, String operator, String ans) {
  //   service.addcalhistorys(inputFull, answer,operator,ans);
  // }
}
