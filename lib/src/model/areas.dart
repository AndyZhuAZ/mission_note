import 'dart:convert';

/// area : [{"id":1,"name":"鎮守府海域","event":false},{"id":2,"name":"南西諸島海域","event":false},{"id":3,"name":"北方海域","event":false},{"id":7,"name":"南西海域","event":false},{"id":4,"name":"西方海域","event":false},{"id":5,"name":"南方海域","event":false},{"id":6,"name":"中部海域","event":false},{"id":52,"name":"帰ってきた鎮守府秋刀魚祭り","event":true},{"id":53,"name":"発令！「捷三号作戦警戒」","event":true}]

Areas areasFromJson(String str) => Areas.fromJson(json.decode(str));

String areasToJson(Areas data) => json.encode(data.toJson());

class Areas {
  Areas({
    List<Area>? area,
  }) {
    _area = area;
  }

  Areas.fromJson(dynamic json) {
    if (json['area'] != null) {
      _area = [];
      json['area'].forEach((v) {
        _area?.add(Area.fromJson(v));
      });
    }
  }

  List<Area>? _area;

  List<Area>? get area => _area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_area != null) {
      map['area'] = _area?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "鎮守府海域"
/// event : false

Area areaFromJson(String str) => Area.fromJson(json.decode(str));

String areaToJson(Area data) => json.encode(data.toJson());

class Area {
  Area({
    int? id,
    String? name,
    bool? event,
  }) {
    _id = id;
    _name = name;
    _event = event;
  }

  Area.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _event = json['event'];
  }

  int? _id;
  String? _name;
  bool? _event;

  int? get id => _id;

  String? get name => _name;

  bool? get event => _event;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['event'] = _event;
    return map;
  }
}
