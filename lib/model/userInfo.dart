import 'package:json_annotation/json_annotation.dart';

part 'userInfo.g.dart';


@JsonSerializable()
class User {
  int level;
  int listenSongs;
  UserPoint userPoint;
  bool mobileSign;
  bool pcSign;
  Profile profile;
  bool peopleCanSeeMyPlayRecord;
  List<Bindings> bindings;
  bool adValid;
  int code;
  int createTime;
  int createDays;

  User({this.level, this.listenSongs, this.userPoint, this.mobileSign, this.pcSign, this.profile, this.peopleCanSeeMyPlayRecord, this.bindings, this.adValid, this.code, this.createTime, this.createDays});

  factory User.fromJson(Map<String,dynamic> json)=>_$UserFromJson(json);
  Map<String,dynamic> toJson()=>_$UserToJson(this);
}
@JsonSerializable()
class UserPoint {
  int userId;
  int balance;
  int updateTime;
  int version;
  int status;
  int blockBalance;

  UserPoint({this.userId, this.balance, this.updateTime, this.version, this.status, this.blockBalance});

  factory UserPoint.fromJson(Map<String,dynamic> json)=>_$UserPointFromJson(json);
  Map<String,dynamic> toJson()=>_$UserPointToJson(this);
}
@JsonSerializable()
class Profile {
  String avatarImgIdStr;
  String backgroundImgIdStr;
  String description;
  int userId;
  bool mutual;
  int createTime;
  int avatarImgId;
  int birthday;
  int gender;
  String nickname;
  int djStatus;
  int accountStatus;
  int province;
  int vipType;
  bool followed;
  int userType;
  String avatarUrl;
  int authStatus;
  String detailDescription;
  int city;
  bool defaultAvatar;
  int backgroundImgId;
  String backgroundUrl;
  String signature;
  int authority;
  int followeds;
  int follows;
  bool blacklist;
  int eventCount;
  int allSubscribedCount;
  int playlistBeSubscribedCount;
  bool followMe;
  int cCount;
  int sDJPCount;
  int playlistCount;
  int sCount;
  int newFollows;

  Profile({this.avatarImgIdStr, this.backgroundImgIdStr, this.description, this.userId, this.mutual, this.createTime, this.avatarImgId, this.birthday, this.gender, this.nickname, this.djStatus, this.accountStatus, this.province, this.vipType, this.followed, this.userType, this.avatarUrl, this.authStatus, this.detailDescription, this.city, this.defaultAvatar, this.backgroundImgId, this.backgroundUrl, this.signature, this.authority, this.followeds, this.follows, this.blacklist, this.eventCount, this.allSubscribedCount, this.playlistBeSubscribedCount, this.followMe, this.cCount, this.sDJPCount, this.playlistCount, this.sCount, this.newFollows});

  factory Profile.fromJson(Map<String,dynamic> json)=>_$ProfileFromJson(json);
  Map<String,dynamic> toJson()=>_$ProfileToJson(this);
}
@JsonSerializable()
class Bindings {
  String url;
  int userId;
  int expiresIn;
  int refreshTime;
  int bindingTime;
  bool expired;
  int id;
  int type;

  Bindings({this.url, this.userId, this.expiresIn, this.refreshTime, this.bindingTime, this.expired, this.id, this.type});

  factory Bindings.fromJson(Map<String,dynamic> json)=>_$BindingsFromJson(json);
  Map<String,dynamic> toJson()=>_$BindingsToJson(this);
}

