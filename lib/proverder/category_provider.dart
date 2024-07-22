import 'package:flutter/material.dart';
import 'package:shopgood/model/category_model.dart';
import 'package:shopgood/service/categoey_service.dart';

class CateogryProvider extends ChangeNotifier {
  final catrgoryService = CategoryService();

  List<dynamic> product = [
    {
      "id": 1,
      "name": "ເສື້ອແຟຣຊັນໃຫມ່ອອກໃຫມ່ນຳເຂົ້າຈາກປະເທດໄທຍ ມີຫລາຍສີໃຫ້ເລືອກ",
      "type": "ເສື້ອ",
      "image":
          "https://img.lazcdn.com/g/p/ee75a0cc5511d90e9aedc9f41d9ed284.jpg_200x200q80.jpg_.webp"
    },
    {
      "id": 2,
      "name": "ເສື້ອແຟຣຊັນໃຫມ່ອອກໃຫມ່ນຳເຂົ້າຈາກປະເທດໄທຍ ມີຫລາຍສີໃຫ້ເລືອກ",
      "type": "ເກີບ",
      "image":
          "https://lzd-img-global.slatic.net/g/p/0137dcd8b35ef818668e818218c1118f.jpg_200x200q80.jpg_.webp"
    },
  ];

  int _currenIndex = 0;
  bool _isloading = false;
  List<CategoryModel> _category = [];
  List<CategoryModel> get category => _category;
  bool get isloading => _isloading;
  int get currenIndex => _currenIndex;
  changeCategory(index) {
    _currenIndex = index;
    notifyListeners();
  }

  Future<void> getAllcategory() async {
    _isloading = true;
    try {
      final result = await catrgoryService.getCategory();
      if (result!.length > 0) {
        _category = result;
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
