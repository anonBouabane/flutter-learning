import 'package:shopgood/compunent/hive_database.dart';

class CartService {
  Future<bool?> addQtyCart({required int qty}) async {
    try {
      final resp = await HiveDatabase.addqtyCart(qty: qty);
      if (resp != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool?> addNewCart({
    required String productID,
    required String name,
    required String detail,
    required int price,
    required int qty,
    required String image,
  }) async {
    try {
      final resp = await HiveDatabase.addNewCart(
          productID: productID,
          name: name,
          detail: detail,
          price: price,
          qty: qty,
          image: image);
      if (resp != null) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
