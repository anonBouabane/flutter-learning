import 'package:flutter/material.dart';
import 'package:shopgood/service/product_service.dart';

class ProductProvider extends ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  List<dynamic> _getallproduct = [];
  List<dynamic> get getallproduct => _getallproduct; 
  final productService = ProDuctService();
  Future<void> getallProduct() async {
    _isloading == true;

    try {
      final result = await productService.getallProduct();
      if (result!.length > 0) {
        _getallproduct = result;
        _isloading == false;
        notifyListeners();
      }
    } catch (e) {
      _isloading = false;
      notifyListeners();
    }
  }

  Future<void> getdataByID({required categoryID}) async {
    _isloading = true;
    try {
      final result =
          await productService.getproduectBYid(categoryID: categoryID);
      if (result!.length > 0) {
        _getallproduct = result;
        _isloading = false;
        notifyListeners();
      }
      return null;
    } catch (e) {
      _isloading = false;
      notifyListeners();
      rethrow;
    }
  }
}
