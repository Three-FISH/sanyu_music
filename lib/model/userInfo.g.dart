// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    level: json['level'] as int,
    listenSongs: json['listenSongs'] as int,
    userPoint: json['userPoint'] == null
        ? null
        : UserPoint.fromJson(json['userPoint'] as Map<String, dynamic>),
    mobileSign: json['mobileSign'] as bool,
    pcSign: json['pcSign'] as bool,
    profile: json['profile'] == null
        ? null
        : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    peopleCanSeeMyPlayRecord: json['peopleCanSeeMyPlayRecord'] as bool,
    bindings: (json['bindings'] as List)
        ?.map((e) =>
            e == null ? null : Bindings.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    adValid: json['adValid'] as bool,
    code: json['code'] as int,
    createTime: json['createTime'] as int,
    createDays: json['createDays'] as int,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'level': instance.level,
      'listenSongs': instance.listenSongs,
      'userPoint': instance.userPoint,
      'mobileSign': instance.mobileSign,
      'pcSign': instance.pcSign,
      'profile': instance.profile,
      'peopleCanSeeMyPlayRecord': instance.peopleCanSeeMyPlayRecord,
      'bindings': instance.bindings,
      'adValid': instance.adValid,
      'code': instance.code,
      'createTime': instance.createTime,
      'createDays': instance.createDays,
    };

UserPoint _$UserPointFromJson(Map<String, dynamic> json) {
  return UserPoint(
    userId: json['userId'] as int,
    balance: json['balance'] as int,
    updateTime: json['updateTime'] as int,
    version: json['version'] as int,
    status: json['status'] as int,
    blockBalance: json['blockBalance'] as int,
  );
}

Map<String, dynamic> _$UserPointToJson(UserPoint instance) => <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'updateTime': instance.updateTime,
      'version': instance.version,
      'status': instance.status,
      'blockBalance': instance.blockBalance,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return Profile(
    avatarImgIdStr: json['avatarImgIdStr'] as String,
    backgroundImgIdStr: json['backgroundImgIdStr'] as String,
    description: json['description'] as String,
    userId: json['userId'] as int,
    mutual: json['mutual'] as bool,
    createTime: json['createTime'] as int,
    avatarImgId: json['avatarImgId'] as int,
    birthday: json['birthday'] as int,
    gender: json['gender'] as int,
    nickname: json['nickname'] as String,
    djStatus: json['djStatus'] as int,
    accountStatus: json['accountStatus'] as int,
    province: json['province'] as int,
    vipType: json['vipType'] as int,
    followed: json['followed'] as bool,
    userType: json['userType'] as int,
    avatarUrl: json['avatarUrl'] as String,
    authStatus: json['authStatus'] as int,
    detailDescription: json['detailDescription'] as String,
    city: json['city'] as int,
    defaultAvatar: json['defaultAvatar'] as bool,
    backgroundImgId: json['backgroundImgId'] as int,
    backgroundUrl: json['backgroundUrl'] as String,
    signature: json['signature'] as String,
    authority: json['authority'] as int,
    followeds: json['followeds'] as int,
    follows: json['follows'] as int,
    blacklist: json['blacklist'] as bool,
    eventCount: json['eventCount'] as int,
    allSubscribedCount: json['allSubscribedCount'] as int,
    playlistBeSubscribedCount: json['playlistBeSubscribedCount'] as int,
    followMe: json['followMe'] as bool,
    cCount: json['cCount'] as int,
    sDJPCount: json['sDJPCount'] as int,
    playlistCount: json['playlistCount'] as int,
    sCount: json['sCount'] as int,
    newFollows: json['newFollows'] as int,
  );
}

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'avatarImgIdStr': instance.avatarImgIdStr,
      'backgroundImgIdStr': instance.backgroundImgIdStr,
      'description': instance.description,
      'userId': instance.userId,
      'mutual': instance.mutual,
      'createTime': instance.createTime,
      'avatarImgId': instance.avatarImgId,
      'birthday': instance.birthday,
      'gender': instance.gender,
      'nickname': instance.nickname,
      'djStatus': instance.djStatus,
      'accountStatus': instance.accountStatus,
      'province': instance.province,
      'vipType': instance.vipType,
      'followed': instance.followed,
      'userType': instance.userType,
      'avatarUrl': instance.avatarUrl,
      'authStatus': instance.authStatus,
      'detailDescription': instance.detailDescription,
      'city': instance.city,
      'defaultAvatar': instance.defaultAvatar,
      'backgroundImgId': instance.backgroundImgId,
      'backgroundUrl': instance.backgroundUrl,
      'signature': instance.signature,
      'authority': instance.authority,
      'followeds': instance.followeds,
      'follows': instance.follows,
      'blacklist': instance.blacklist,
      'eventCount': instance.eventCount,
      'allSubscribedCount': instance.allSubscribedCount,
      'playlistBeSubscribedCount': instance.playlistBeSubscribedCount,
      'followMe': instance.followMe,
      'cCount': instance.cCount,
      'sDJPCount': instance.sDJPCount,
      'playlistCount': instance.playlistCount,
      'sCount': instance.sCount,
      'newFollows': instance.newFollows,
    };

Bindings _$BindingsFromJson(Map<String, dynamic> json) {
  return Bindings(
    url: json['url'] as String,
    userId: json['userId'] as int,
    expiresIn: json['expiresIn'] as int,
    refreshTime: json['refreshTime'] as int,
    bindingTime: json['bindingTime'] as int,
    expired: json['expired'] as bool,
    id: json['id'] as int,
    type: json['type'] as int,
  );
}

Map<String, dynamic> _$BindingsToJson(Bindings instance) => <String, dynamic>{
      'url': instance.url,
      'userId': instance.userId,
      'expiresIn': instance.expiresIn,
      'refreshTime': instance.refreshTime,
      'bindingTime': instance.bindingTime,
      'expired': instance.expired,
      'id': instance.id,
      'type': instance.type,
    };
