// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_mart/model/product_model.dart';

class CartProvider extends ChangeNotifier{
  final List<ProductModel> _products =[];
  List<ProductModel>  get products => _products;

  void add(ProductModel item){
      _products.add(item);
      print(item.toString());
      notifyListeners();
  }

  void remove(ProductModel item){
    _products.remove(item);
    notifyListeners();
  }

  void removeAll(){
    _products.clear();
  }

    
  double getCartTotal(){
      return _products.fold(0, (previousValue,item)=>previousValue +item.price );
  }
   

   final List<String> _dropdown = ['one', 'two', 'three'];
   List<String> get dropdown => _dropdown;
  String selecetedItem = 'one';
    
  void setSelectedItem(String value){
    selecetedItem = value;
    notifyListeners();
  }

}