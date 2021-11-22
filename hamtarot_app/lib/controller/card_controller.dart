import 'dart:async';

import 'package:hamtarot_app/Services/card_service.dart';
import 'package:hamtarot_app/model/card_model.dart';

class CardController {
  final Services service;
  List<Card1> card = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  CardController(this.service);

  Future<List<Card1>> Fectcard() async {
    onSyncController.add(true);
    card = await service.getcard();
    onSyncController.add(false);
    return card;
  }
}
