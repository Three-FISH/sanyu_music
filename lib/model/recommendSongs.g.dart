// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendSongs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendSongs _$RecommendSongsFromJson(Map<String, dynamic> json) {
  return RecommendSongs(
    code: json['code'] as int,
    song: json['song'] == null
        ? null
        : Song.fromJson(json['song'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RecommendSongsToJson(RecommendSongs instance) =>
    <String, dynamic>{
      'code': instance.code,
      'song': instance.song,
    };

Song _$SongFromJson(Map<String, dynamic> json) {
  return Song(
    dailySongs: (json['dailySongs'] as List)
        ?.map((e) =>
            e == null ? null : DailySongs.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    recommendReasons: (json['recommendReasons'] as List)
        ?.map((e) => e == null
            ? null
            : RecommendReasons.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SongToJson(Song instance) => <String, dynamic>{
      'dailySongs': instance.dailySongs,
      'recommendReasons': instance.recommendReasons,
    };

DailySongs _$DailySongsFromJson(Map<String, dynamic> json) {
  return DailySongs(
    name: json['name'] as String,
    id: json['id'] as int,
    pst: json['pst'] as int,
    t: json['t'] as int,
    ar: (json['ar'] as List)
        ?.map((e) => e == null ? null : Ar.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pop: json['pop'] as int,
    st: json['st'] as int,
    rt: json['rt'] as String,
    fee: json['fee'] as int,
    v: json['v'] as int,
    al: json['al'] == null
        ? null
        : Al.fromJson(json['al'] as Map<String, dynamic>),
    dt: json['dt'] as int,
    h: json['h'] == null ? null : H.fromJson(json['h'] as Map<String, dynamic>),
    m: json['m'] == null ? null : H.fromJson(json['m'] as Map<String, dynamic>),
    l: json['l'] == null ? null : H.fromJson(json['l'] as Map<String, dynamic>),
    cd: json['cd'] as String,
    publishTime: json['publishTime'] as int,
    reason: json['reason'] as String,
    privilege: json['privilege'] == null
        ? null
        : Privilege.fromJson(json['privilege'] as Map<String, dynamic>),
    alg: json['alg'] as String,
  );
}

Map<String, dynamic> _$DailySongsToJson(DailySongs instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'pst': instance.pst,
      't': instance.t,
      'ar': instance.ar,
      'pop': instance.pop,
      'st': instance.st,
      'rt': instance.rt,
      'fee': instance.fee,
      'v': instance.v,
      'al': instance.al,
      'dt': instance.dt,
      'h': instance.h,
      'm': instance.m,
      'l': instance.l,
      'cd': instance.cd,
      'publishTime': instance.publishTime,
      'reason': instance.reason,
      'privilege': instance.privilege,
      'alg': instance.alg,
    };

Ar _$ArFromJson(Map<String, dynamic> json) {
  return Ar(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ArToJson(Ar instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Al _$AlFromJson(Map<String, dynamic> json) {
  return Al(
    id: json['id'] as int,
    name: json['name'] as String,
    picUrl: json['picUrl'] as String,
    picStr: json['picStr'] as String,
    pic: json['pic'] as int,
  );
}

Map<String, dynamic> _$AlToJson(Al instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picUrl': instance.picUrl,
      'picStr': instance.picStr,
      'pic': instance.pic,
    };

H _$HFromJson(Map<String, dynamic> json) {
  return H(
    br: json['br'] as int,
    fid: json['fid'] as int,
    size: json['size'] as int,
    vd: json['vd'] as int,
  );
}

Map<String, dynamic> _$HToJson(H instance) => <String, dynamic>{
      'br': instance.br,
      'fid': instance.fid,
      'size': instance.size,
      'vd': instance.vd,
    };

Privilege _$PrivilegeFromJson(Map<String, dynamic> json) {
  return Privilege(
    id: json['id'] as int,
    fee: json['fee'] as int,
    payed: json['payed'] as int,
    st: json['st'] as int,
    pl: json['pl'] as int,
    dl: json['dl'] as int,
    sp: json['sp'] as int,
    cp: json['cp'] as int,
    subp: json['subp'] as int,
    cs: json['cs'] as bool,
    maxbr: json['maxbr'] as int,
    fl: json['fl'] as int,
    toast: json['toast'] as bool,
    flag: json['flag'] as int,
    preSell: json['preSell'] as bool,
  );
}

Map<String, dynamic> _$PrivilegeToJson(Privilege instance) => <String, dynamic>{
      'id': instance.id,
      'fee': instance.fee,
      'payed': instance.payed,
      'st': instance.st,
      'pl': instance.pl,
      'dl': instance.dl,
      'sp': instance.sp,
      'cp': instance.cp,
      'subp': instance.subp,
      'cs': instance.cs,
      'maxbr': instance.maxbr,
      'fl': instance.fl,
      'toast': instance.toast,
      'flag': instance.flag,
      'preSell': instance.preSell,
    };

RecommendReasons _$RecommendReasonsFromJson(Map<String, dynamic> json) {
  return RecommendReasons(
    songId: json['songId'] as int,
    reason: json['reason'] as String,
  );
}

Map<String, dynamic> _$RecommendReasonsToJson(RecommendReasons instance) =>
    <String, dynamic>{
      'songId': instance.songId,
      'reason': instance.reason,
    };
