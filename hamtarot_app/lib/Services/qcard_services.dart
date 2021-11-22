import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/qcard_model.dart';

abstract class Services {
  Future<List<Qcard>> getQcard();
}

class QcardServices extends Services {
  @override
  Future<List<Qcard>> getQcard () async {
    QuerySnapshot snapshot =
      await FirebaseFirestore
      .instance
      .collection('ham_qcard')
      .get();

    AllQcard qcard = AllQcard.fromSnapshot(snapshot);
    return qcard.qcard;
  }

}