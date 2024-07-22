// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<CategoryModel> categoryModelFromeJson(String str) =>
    List<CategoryModel>.from(json.decode(str).map(
          (x) => CategoryModel.fromJson(x),
        ));

class CategoryModel {
  final String? id;
  final String? title;
   
 
  CategoryModel({
    this.id,
    this.title,
  
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"],
        title: json["title"],
       
      );
  Map<String, dynamic> tojson() =>
      {"id": id, "title": title,  };
}
