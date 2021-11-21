
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String fullname;
  String gender;
  DateTime birthday;
  String phoneNo;
  String image;
  String email;
  String uid;
  bool isLoggedIn;

  User(
    this.fullname,
    this.gender,
    this.birthday,
    this.phoneNo,
    this.image,
    this.email,
    this.uid,
    this.isLoggedIn,
  );

  factory User.fromJson(
    Map<String, dynamic> json,
  ) {
    return User(
      json['fullname'] as String,
      json['gender'] as String,
      json['birthday'] as DateTime,
      json['phoneNo'] as String,
      json['image'] as String,
      json['email'] as String,
      json['uid'] as String,
      json['isLoggedIn'] as bool,
    );
  }
}

class AllUsers {
  final List<User> users;
  AllUsers(this.users);

  factory AllUsers.fromJson(List<dynamic> json) {
    List<User> users;

    users = json.map((index) => User.fromJson(index)).toList();

    return AllUsers(users);
  }

  factory AllUsers.fromSnapshot(QuerySnapshot s) {
    List<User> users = s.docs.map((DocumentSnapshot ds) {
      return User.fromJson(ds.data() as Map<String, dynamic>);
    }).toList();

    return AllUsers(users);
  }
}