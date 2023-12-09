import 'package:flutter/material.dart';

class ProviderApp extends ChangeNotifier {
  String nameSelected = '';
  String get getName => nameSelected;
  final List<String> _names = [
    'Abby',
    'Alan',
    'Sath',
    'Chloe',
    'Diana',
    'Ethan',
    'Felix',
    'Grace',
  ];
  List<String> get getNames => _names;

  void detailed(int index) {
    nameSelected = _names[index];
    notifyListeners();
  }
}
