import 'package:flutter/material.dart';

class FilterLocation with ChangeNotifier {
  int? _locationId;
  int? get locationId => _locationId;
  void setId(int id) {
    _locationId = id;
    notifyListeners();
  }
}
