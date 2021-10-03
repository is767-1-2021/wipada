import 'package:flutter/cupertino.dart';

class Namemodel extends ChangeNotifier {
  String? _name;

  get Name => this._name;

  set Name(value) {
    this._name = value;
    notifyListeners();
  }
}
