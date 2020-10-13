
import 'package:json_annotation/json_annotation.dart';
part 'personalSong.g.dart';
@JsonSerializable()
class PersonalSong {
  bool hasTaste;
  int code;
  int category;
  List<Recommend> result;

  PersonalSong({this.hasTaste, this.code, this.category, this.result});

  factory PersonalSong.fromJson(Map<String,dynamic> json)=>_$PersonalSongFromJson(json);
  Map<String,dynamic> toJson()=>_$PersonalSongToJson(this);
}
@JsonSerializable()
class Recommend {
  int id;
  int type;
  String name;
  String copywriter;
  String picUrl;
  bool canDislike;
  int trackNumberUpdateTime;
  int playCount;
  int trackCount;
  bool highQuality;
  String alg;

  Recommend(
      {this.id,
        this.type,
        this.name,
        this.copywriter,
        this.picUrl,
        this.canDislike,
        this.trackNumberUpdateTime,
        this.playCount,
        this.trackCount,
        this.highQuality,
        this.alg});

  factory Recommend.fromJson(Map<String,dynamic> json)=>_$RecommendFromJson(json);
  Map<String,dynamic> toJson()=>_$RecommendToJson(this);
}
