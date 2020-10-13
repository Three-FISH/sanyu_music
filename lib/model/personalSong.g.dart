// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalSong.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalSong _$PersonalSongFromJson(Map<String, dynamic> json) {
  return PersonalSong(
    hasTaste: json['hasTaste'] as bool,
    code: json['code'] as int,
    category: json['category'] as int,
    result: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Recommend.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PersonalSongToJson(PersonalSong instance) =>
    <String, dynamic>{
      'hasTaste': instance.hasTaste,
      'code': instance.code,
      'category': instance.category,
      'result': instance.result,
    };

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return Recommend(
    id: json['id'] as int,
    type: json['type'] as int,
    name: json['name'] as String,
    copywriter: json['copywriter'] as String,
    picUrl: json['picUrl'] as String,
    canDislike: json['canDislike'] as bool,
    trackNumberUpdateTime: json['trackNumberUpdateTime'] as int,
    playCount: json['playCount'] as int,
    trackCount: json['trackCount'] as int,
    highQuality: json['highQuality'] as bool,
    alg: json['alg'] as String,
  );
}

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'copywriter': instance.copywriter,
      'picUrl': instance.picUrl,
      'canDislike': instance.canDislike,
      'trackNumberUpdateTime': instance.trackNumberUpdateTime,
      'playCount': instance.playCount,
      'trackCount': instance.trackCount,
      'highQuality': instance.highQuality,
      'alg': instance.alg,
    };
