import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamtarot_app/model/temple_model.dart';



abstract class Services {
  Future<List<Temple>> gettemple();

  }


class TempleServices extends Services {
  @override
  Future<List<Temple>> gettemple() async {
    QuerySnapshot snapshot = // read DB
        await FirebaseFirestore.instance
        .collection('ham_temple')
        //  .where('id',isGreaterThan: 1) // select data
        .get();
     
      AllTemple temple = AllTemple.fromSnapshot(snapshot);
    return temple.temple;
  }


}

  
  
 