import 'package:flutter/material.dart';
class Favorite with ChangeNotifier{
  List<Map> _favoriteItems=[];
  void addItem(Map item){
    _favoriteItems.add(item);
    notifyListeners();
  }
  void removeItem(int id){
    _favoriteItems.removeWhere((element) => element['id']==id);
    notifyListeners();
  }
  List<Map> getFavoriteList(){
    return _favoriteItems;
  }
}