// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Login_notify extends ChangeNotifier {
  bool _issecured = true;

  bool get issecured => _issecured;
  set issecured(bool newstate) {
    _issecured = newstate;
    notifyListeners();
  }
}
