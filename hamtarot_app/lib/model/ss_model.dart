import 'package:cloud_firestore/cloud_firestore.dart';

class SS {
  final int id;
  final String content;
  final String img;


  SS(this.id, this.content, this.img);

  factory SS.fromJson(
    Map<String, dynamic> json,
  ) {
    return SS(
      json['id'] as int,
      json['content'] as String,
      json['img'] as String,
   
    );
  }
}

class AllSS {
  final List<SS> ss;
  AllSS(this.ss);

  factory AllSS.fromJson(List<dynamic> json) {
    List<SS> ss;

    ss = json.map((index) => SS.fromJson(index)).toList();
    return AllSS(ss);
  }

  factory AllSS.fromSnapshot(QuerySnapshot s) {
    List<SS> ss = s.docs.map((DocumentSnapshot ds) {
      return SS.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllSS(ss);
  }
}
