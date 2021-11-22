import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/card_model.dart';

abstract class Services {
  Future<List<Card1>> getcard();
}

class CardServices extends Services {
  @override
  Future<List<Card1>> getcard() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('ham_card')
        //  .where('id',isGreaterThan: 1) // select data
        .get();

    AllCard1 card = AllCard1.fromSnapshot(snapshot);
    return card.card;
  }
}
