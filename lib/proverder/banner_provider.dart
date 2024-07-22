import 'package:flutter/material.dart';
import 'package:shopgood/model/banner.dart';
import 'package:shopgood/service/banner_service.dart';

class BannerProvider extends ChangeNotifier {
  List<BannerModel> _banners = [];
  List<BannerModel> get banners => _banners;
  final bannerService = BannerService();
  bool _isloading = false;
  get isloading => _isloading;
  Future<void> getAllBanner() async {
    _isloading = true;
    try {
      final resp = await bannerService.getAllBanner();
      if (resp!.length>0) {
        _banners = resp;
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
