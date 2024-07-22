import 'package:dio/dio.dart'; 
import 'package:shopgood/compunent/api_path.dart';

class ProDuctService {
  final dio = Dio();
  Future<List<dynamic>?> getallProduct() async {
    try {
      final resp = await dio.get(ApiPath.getProductAll);
      if (resp.data['status'] == true) {
        return resp.data['data'];
      }
      return null;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<List<dynamic>?> getproduectBYid({required String categoryID}) async {
    try {
      final resp = await dio.get(ApiPath.getProductByCategory + categoryID);
      if (resp.data['status'] == true) {
        return resp.data['data'];
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }
}
