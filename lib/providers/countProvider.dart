import 'package:flutter/material.dart';

class Count with ChangeNotifier{
  int? _count;
  int? get count => _count;

  setCount(value){
    _count = value;
    notifyListeners();
  }
}