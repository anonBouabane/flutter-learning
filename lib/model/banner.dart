// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

List<BannerModel> bannerModelFromeJson(String str) =>
    List<BannerModel>.from(json.decode(str).map(
          (x) => BannerModel.fromJson(x),
        ));

class BannerModel {
  final String? id;
  final String? name;
  final String? detail;
  final String? image;
  BannerModel({
    this.id,
    this.name,
    this.detail,
    this.image,
  });
  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["_id"],
        name: json["name"],
        detail: json['detail'],
        image: json['image'],
      );
  Map<String, dynamic> tojson() =>
      {"id": id, "name": name, "detail": detail, "image": image};
}
