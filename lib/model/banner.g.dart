// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    banners: (json['banners'] as List)
        ?.map((e) =>
            e == null ? null : Banners.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'banners': instance.banners,
      'code': instance.code,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) {
  return Banners(
    pic: json['pic'] as String,
    targetId: json['targetId'] as int,
    typeTitle: json['typeTitle'] as String,
  );
}

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'pic': instance.pic,
      'targetId': instance.targetId,
      'typeTitle': instance.typeTitle,
    };
