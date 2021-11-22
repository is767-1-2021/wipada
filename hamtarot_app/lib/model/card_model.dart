import 'package:cloud_firestore/cloud_firestore.dart';

class Card1 {
  final int id;
  final String card;
  final String content;
  final String work;
  final String money;
  final String love;
  final String img;

  Card1(this.id, this.card, this.content, this.work, this.money, this.love,
      this.img);

  factory Card1.fromJson(
    Map<String, dynamic> json,
  ) {
    return Card1(
      json['id'] as int,
      json['card'] as String,
      json['content'] as String,
      json['work'] as String,
      json['money'] as String,
      json['love'] as String,
      json['img'] as String,
    );
  }
}

class AllCard1 {
  final List<Card1> card;
  AllCard1(this.card);

  factory AllCard1.fromJson(List<dynamic> json) {
    List<Card1> card;

    card = json.map((index) => Card1.fromJson(index)).toList();
    return AllCard1(card);
  }

  factory AllCard1.fromSnapshot(QuerySnapshot s) {
    List<Card1> card = s.docs.map((DocumentSnapshot ds) {
      return Card1.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllCard1(card);
  }
}
