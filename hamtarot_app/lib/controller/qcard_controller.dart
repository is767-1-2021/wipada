import 'dart:async';

import 'package:hamtarot_app/Services/qcard_services.dart';
import 'package:hamtarot_app/model/qcard_model.dart';

class QcardController {
  final Services service;
  List<Qcard> qcard = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  QcardController(this.service);

  Future<List<Qcard>> fectQcard() async {
    onSyncController.add(true);
    qcard = await service.getQcard();
    onSyncController.add(false);
    return qcard;
  }
}
