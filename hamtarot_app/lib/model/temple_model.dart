import 'package:cloud_firestore/cloud_firestore.dart';

class Temple {
  final int id;
  final String title;
  final String content;
  final String image;
  final String detail;
  final String time;
 

  Temple(this.id, this.title, this.content,this.image,this.detail,this.time);

  factory Temple.fromJson(
    Map<String, dynamic> json,
  ) {
    return Temple(
      json['id'] as int,
      json['title'] as String,
      json['content'] as String,
      json['image'] as String,
      json['detail'] as String,
      json['time'] as String,
    );
  }
}



class AllTemple {
  final List<Temple> temple;
  AllTemple(this.temple);

  factory AllTemple.fromJson(List<dynamic> json) {
    List<Temple> temple;

    temple = json.map((index) => Temple.fromJson(index)).toList();
    return AllTemple(temple);
  }

  factory AllTemple.fromSnapshot(QuerySnapshot s) {
    List<Temple> temple = s.docs.map((DocumentSnapshot ds) {
      return Temple.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllTemple(temple);
  }
}
