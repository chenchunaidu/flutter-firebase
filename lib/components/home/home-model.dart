import 'package:json_annotation/json_annotation.dart';

part 'home-model.g.dart';

@JsonSerializable()
class HomeModel {
  String name;
  int price;
  List<String> images;

  HomeModel({required this.name, required this.price, required this.images});

  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);
}
