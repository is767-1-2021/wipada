import 'package:cloud_firestore/cloud_firestore.dart';

class Qcard {
  final int id;
  final String name;
  final String content;

  Qcard(this.id, this.name, this.content);

  factory Qcard.fromJson(
    Map<String, dynamic> json,
  ) {
    return Qcard(
      json['id'] as int,
      json['name'] as String,
      json['content'] as String,
    );
  }
}

class AllQcard {
  final List<Qcard> qcard;
  AllQcard (this.qcard);

  factory AllQcard .fromJson(List<dynamic> json) {
    List<Qcard> qcard;

    qcard = json.map((index) => Qcard.fromJson(index)).toList();
    
    return AllQcard (qcard);
  }

  factory AllQcard .fromSnapshot(QuerySnapshot s) {
    List<Qcard> qcard = s.docs.map((DocumentSnapshot ds) {
      return Qcard.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllQcard (qcard);

  }
}