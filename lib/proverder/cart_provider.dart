import 'package:flutter/material.dart';
import 'package:shopgood/service/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final cartService = CartService();
  bool _isloading = false;
  bool get isloading => _isloading;

  Future<void> addNewCart({
    required String productID,
    required String name,
    required String detail,
    required int qty,
    required int price,
    required String image,
  }) async {
    _isloading = true;
    try {
      final result = await cartService.addNewCart(
          productID: productID,
          name: name,
          detail: detail,
          price: price,
          qty: qty,
          image: image);
      if (result != null) {
        _isloading = false;
        notifyListeners();
      }
    } catch (e) {
      _isloading = false;
      notifyListeners();
      rethrow;
    }
  }
}
