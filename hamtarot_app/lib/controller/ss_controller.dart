
import 'dart:async';

import 'package:hamtarot_app/model/ss_model.dart';
import 'package:hamtarot_app/service/ss_service.dart';


class SSController {
  final Services service;
  List<SS> ss = List.empty();

  StreamController<bool> onSyncController = StreamController();// checking status stream onsync (on process / finish)
  Stream<bool> get onSync => onSyncController.stream; 

  SSController(this.service);

  Future<List<SS>> Fectseamsee() async {
    onSyncController.add(true); // stream connected
    ss = await service.getseamsee();
    onSyncController.add(false); // stop connected
    return ss;
  }
}