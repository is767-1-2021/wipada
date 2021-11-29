import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_app/calmodel.dart';

abstract class Services {
  Future<List<CalHistory>> getcalhistory();
  // Future<void> addcalhistorys(String inputFull, String answer, String operator, String ans);
}

class CalHistoryServices extends Services {
  @override
  Future<List<CalHistory>> getcalhistory() async {
    QuerySnapshot snapshot = // read DB
        await FirebaseFirestore.instance
            .collection('history')
            .orderBy('historydate', descending: true)
            .get();

    AllCalHistory calhistory = AllCalHistory.fromSnapshot(snapshot);
    return calhistory.calhistory;
  }

  // CollectionReference calhistory =
  //     FirebaseFirestore.instance.collection('history');
  // Future<void> addcalhistorys(
  //     String inputFull, String answer, String operator, String ans) async {
  //   await FirebaseFirestore.instance.collection('history').add(
  //     {'input1': inputFull, 'input2': answer, 'sign': operator, 'result': ans
  //     ,'historydate': Timestamp.now()
  //     },
  //   );
  // }

}
