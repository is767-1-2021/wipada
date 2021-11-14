

import 'package:cloud_firestore/cloud_firestore.dart';

class KS {   //PurHistory//
  final int qty; //qtyPurchase//
  final int price; //pricePurchase//
  final String username;
  final String lot; //lotNumPurchase//
  final String date; //datePurchase//


  KS(this.qty, this.price, this.username,this.lot,this.date);
  //PurHistory(this.qtyPurchase,this.pricePurchase,this.username,this.lotNumPurchase,this.datePurchase)

  factory KS.fromJson(   //PurHistory//
    Map<String, dynamic> json,
  ) {
    return KS(
      json['qty'] as int,  //qtyPurchase//
      json['price'] as int, //pricePurchase//
      json['username'] as String,
      json['lot'] as String, //lotNumPurchase//
      json['date'] as String, //datePurchase//
   
    );
  }
}

class AllKS { //AllPurHistory
  final List<KS> ks; //PurHistory
  AllKS(this.ks); // AllPurHistory

  factory AllKS.fromJson(List<dynamic> json) { //AllPurHistory
    List<KS> ks; //<PurHistory> purhistory

    ks = json.map((index) => KS.fromJson(index)).toList(); //purhistory => PurHistory
    return AllKS(ks); //AllPurHistory(purhistory)
  }

  factory AllKS.fromSnapshot(QuerySnapshot s) {  //AllPurHistory
    List<KS> ks = s.docs.map((DocumentSnapshot ds) { //<PurHistory> purhistory
      return KS.fromJson(ds.data() as Map<String, dynamic>); //PurHistory
    }).toList();

    return AllKS(ks); //AllPurHistory (purhistory)
  }
}