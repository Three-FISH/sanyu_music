
import 'package:json_annotation/json_annotation.dart';
part 'banner.g.dart';
@JsonSerializable()
class Banner {
  List<Banners> banners;
  int code;

  Banner({this.banners, this.code});

  factory Banner.fromJson(Map<String,dynamic> json)=>_$BannerFromJson(json);
  Map<String,dynamic> toJson()=>_$BannerToJson(this);
}
@JsonSerializable()
class Banners {
  String pic;
  int targetId;
  String typeTitle;

  Banners(
      {this.pic,
        this.targetId,
        this.typeTitle,
       });

  factory Banners.fromJson(Map<String,dynamic> json)=>_$BannersFromJson(json);
  Map<String,dynamic> toJson()=>_$BannersToJson(this);
}
