import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'card_item.dart';

class Data with ChangeNotifier {

  List<CardItem> items;

  Data() {
    items = List();
    for (int i=0; i<10; i++){
      items.add(CardItem((i+1).toString()));
    }
  }

  List<CardItem> get itemsList => items;

  removeLastItem() {
    items.removeLast();
    notifyListeners();
  }
}