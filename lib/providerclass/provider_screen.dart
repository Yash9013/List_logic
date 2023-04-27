import 'package:flutter/material.dart';
import '../screens/model_screen.dart';

class DataClass extends ChangeNotifier {
  List<ModelClass> emptylist = [];

  addUserData(String name, age, category, jobtitle) {
    emptylist.add(ModelClass(name, age, category, jobtitle));
    notifyListeners();
  }
}
