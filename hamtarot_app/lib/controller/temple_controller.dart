import 'dart:async';

import 'package:hamtarot_app/model/temple_model.dart';
import 'package:hamtarot_app/service/temple_service.dart';



class TempleController {
  final Services service;
  List<Temple> temple = List.empty();

  StreamController<bool> onSyncController = StreamController();// checking status stream onsync (on process / finish)
  Stream<bool> get onSync => onSyncController.stream; 

  TempleController(this.service);

  Future<List<Temple>> Fecttemple() async {
    onSyncController.add(true); // stream connected
    temple = await service.gettemple();
    onSyncController.add(false); // stop connected
    return temple;
  }
}

//   void updateTodo(int _id, bool _completed) {
//     service.updateTodos(_id, _completed);
//   }
// }
