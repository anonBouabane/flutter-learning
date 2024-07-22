import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shopgood/model/banner.dart';
import 'package:shopgood/compunent/api_path.dart';

class BannerService {
  final dio = new Dio();
  Future<List<BannerModel>?> getAllBanner() async {
    try {
      final response = await dio.get(ApiPath.getallBanner);
      if (response.data['status'] == true) {
        final banner = bannerModelFromeJson(jsonEncode(response.data['data']));
        return banner; 
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }
}
