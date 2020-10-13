import 'package:json_annotation/json_annotation.dart';
part 'recommendSongs.g.dart';
@JsonSerializable()
class RecommendSongs {
  int code;
  Song song;

  RecommendSongs({this.code, this.song});
  factory RecommendSongs.fromJson(Map<String,dynamic> json)=>_$RecommendSongsFromJson(json);
  Map<String,dynamic> toJson()=>_$RecommendSongsToJson(this);
}
@JsonSerializable()
class Song {
  List<DailySongs> dailySongs;
  List<RecommendReasons> recommendReasons;

  Song({this.dailySongs,this.recommendReasons});
  factory Song.fromJson(Map<String,dynamic> json)=>_$SongFromJson(json);
  Map<String,dynamic> toJson()=>_$SongToJson(this);
}
@JsonSerializable()
class DailySongs {
  String name;
  int id;
  int pst;
  int t;
  List<Ar> ar;
  int pop;
  int st;
  String rt;
  int fee;
  int v;
  Al al;
  int dt;
  H h;
  H m;
  H l;
  String cd;
  int publishTime;
  String reason;
  Privilege privilege;
  String alg;

  DailySongs(
      {this.name,
        this.id,
        this.pst,
        this.t,
        this.ar,
        this.pop,
        this.st,
        this.rt,
        this.fee,
        this.v,
        this.al,
        this.dt,
        this.h,
        this.m,
        this.l,
        this.cd,
        this.publishTime,
        this.reason,
        this.privilege,
        this.alg});

  factory DailySongs.fromJson(Map<String,dynamic> json)=>_$DailySongsFromJson(json);
  Map<String,dynamic> toJson()=>_$DailySongsToJson(this);
}
@JsonSerializable()
class Ar {
  int id;
  String name;

  Ar({this.id, this.name});
  factory Ar.fromJson(Map<String,dynamic> json)=>_$ArFromJson(json);
  Map<String,dynamic> toJson()=>_$ArToJson(this);
}
@JsonSerializable()
class Al {
  int id;
  String name;
  String picUrl;
  String picStr;
  int pic;

  Al({this.id, this.name, this.picUrl, this.picStr, this.pic});
  factory Al.fromJson(Map<String,dynamic> json)=>_$AlFromJson(json);
  Map<String,dynamic> toJson()=>_$AlToJson(this);
}
@JsonSerializable()
class H {
  int br;
  int fid;
  int size;
  int vd;

  H({this.br, this.fid, this.size, this.vd});

  factory H.fromJson(Map<String,dynamic> json)=>_$HFromJson(json);
  Map<String,dynamic> toJson()=>_$HToJson(this);
}
@JsonSerializable()
class Privilege {
  int id;
  int fee;
  int payed;
  int st;
  int pl;
  int dl;
  int sp;
  int cp;
  int subp;
  bool cs;
  int maxbr;
  int fl;
  bool toast;
  int flag;
  bool preSell;

  Privilege(
      {this.id,
        this.fee,
        this.payed,
        this.st,
        this.pl,
        this.dl,
        this.sp,
        this.cp,
        this.subp,
        this.cs,
        this.maxbr,
        this.fl,
        this.toast,
        this.flag,
        this.preSell});

  factory Privilege.fromJson(Map<String,dynamic> json)=>_$PrivilegeFromJson(json);
  Map<String,dynamic> toJson()=>_$PrivilegeToJson(this);
}
@JsonSerializable()
class RecommendReasons {
  int songId;
  String reason;

  RecommendReasons({this.songId, this.reason});

  factory RecommendReasons.fromJson(Map<String,dynamic> json)=>_$RecommendReasonsFromJson(json);
  Map<String,dynamic> toJson()=>_$RecommendReasonsToJson(this);
}
