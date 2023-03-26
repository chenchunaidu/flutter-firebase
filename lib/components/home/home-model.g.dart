// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home-model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
      name: json['name'] as String,
      price: json['price'] as int,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'images': instance.images,
    };
