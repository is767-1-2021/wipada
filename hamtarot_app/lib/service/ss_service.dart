
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/ss_model.dart';

abstract class Services {
  Future<List<SS>> getseamsee();

  }


class SSServices extends Services {
  @override
  Future<List<SS>> getseamsee() async {
    QuerySnapshot snapshot = // read DB
        await FirebaseFirestore.instance
        .collection('ham_ss')
        //  .where('id',isGreaterThan: 1) // select data
        .get();
     
      AllSS ss = AllSS.fromSnapshot(snapshot);
    return ss.ss;
  }


}