import 'dart:convert';
import 'package:http/http.dart' as http;

/// operation : [{"area":1,"id":1,"name":"鎮守府正面海域","type":"normal"},{"area":1,"id":2,"name":"南西諸島沖","type":"normal"},{"area":1,"id":3,"name":"製油所地帯沿岸","type":"normal"},{"area":1,"id":4,"name":"南西諸島防衛線","type":"normal"},{"area":1,"id":5,"name":"鎮守府近海","type":"extra"},{"area":1,"id":6,"name":"鎮守府近海航路","type":"extra"},{"area":2,"id":1,"name":"南西諸島近海","type":"normal"},{"area":2,"id":2,"name":"バシー海峡","type":"normal"},{"area":2,"id":3,"name":"東部オリョール海","type":"normal"},{"area":2,"id":4,"name":"沖ノ島海域","type":"normal"},{"area":2,"id":5,"name":"沖ノ島沖","type":"extra"},{"area":3,"id":1,"name":"モーレイ海","type":"normal"},{"area":3,"id":2,"name":"キス島沖","type":"normal"},{"area":3,"id":3,"name":"アルフォンシーノ方面","type":"normal"},{"area":3,"id":4,"name":"北方海域全域","type":"normal"},{"area":3,"id":5,"name":"北方AL海域","type":"extra"},{"area":4,"id":1,"name":"ジャム島沖","type":"normal"},{"area":4,"id":2,"name":"カレー洋海域","type":"normal"},{"area":4,"id":3,"name":"リランカ島","type":"normal"},{"area":4,"id":4,"name":"カスガダマ島","type":"normal"},{"area":4,"id":5,"name":"カレー洋リランカ島沖","type":"extra"},{"area":5,"id":1,"name":"南方海域前面","type":"normal"},{"area":5,"id":2,"name":"珊瑚諸島沖","type":"normal"},{"area":5,"id":3,"name":"サブ島沖海域","type":"normal"},{"area":5,"id":4,"name":"サーモン海域","type":"normal"},{"area":5,"id":5,"name":"サーモン海域北方","type":"extra"},{"area":6,"id":1,"name":"中部海域哨戒線","type":"normal"},{"area":6,"id":2,"name":"MS諸島沖","type":"normal"},{"area":6,"id":3,"name":"グアノ環礁沖海域","type":"normal"},{"area":6,"id":4,"name":"中部北海域ピーコック島沖","type":"normal"},{"area":6,"id":5,"name":"KW環礁沖海域","type":"extra"},{"area":7,"id":1,"name":"ブルネイ泊地沖","type":"normal"},{"area":7,"id":2,"name":"タウイタウイ泊地沖","type":"normal"},{"area":7,"id":3,"name":"ペナン島沖","type":"normal"},{"area":7,"id":4,"name":"昭南本土航路","type":"normal"},{"area":42,"id":1,"name":"南西作戦海域方面 バリ島沖","type":"event"},{"area":42,"id":2,"name":"西方作戦海域方面 マラッカ海峡北方","type":"event"},{"area":42,"id":3,"name":"西方作戦海域方面 セイロン島南西沖","type":"event"},{"area":42,"id":4,"name":"欧州作戦海域方面 地中海マルタ島沖","type":"event"},{"area":42,"id":5,"name":"欧州作戦海域方面 北海/北大西洋海域","type":"event"},{"area":43,"id":1,"name":"ブラケット水道/クラ湾沖","type":"event"},{"area":43,"id":2,"name":"ラバウル/中部ソロモン海域","type":"event"},{"area":43,"id":3,"name":"中部ソロモン海域 ブーゲンビル島沖","type":"event"},{"area":44,"id":1,"name":"津軽海峡/北海道沖/南千島沖","type":"event"},{"area":44,"id":2,"name":"九州南部/南西諸島沖","type":"event"},{"area":44,"id":3,"name":"アリューシャン列島沖","type":"event"},{"area":44,"id":4,"name":"北太平洋ハワイ諸島戦域","type":"event"},{"area":44,"id":5,"name":"北太平洋ハワイ諸島南東沖","type":"event"},{"area":45,"id":1,"name":null,"type":"event"},{"area":45,"id":2,"name":null,"type":"event"},{"area":45,"id":3,"name":null,"type":"event"},{"area":46,"id":1,"name":"マカッサル沖/バリ島沖","type":"event"},{"area":46,"id":2,"name":"ジャワ沖/ダーウィン沖","type":"event"},{"area":46,"id":3,"name":"ジャワ海/スラバヤ沖","type":"event"},{"area":46,"id":4,"name":"バタビア沖","type":"event"},{"area":46,"id":5,"name":"ダバオ沖/太平洋南西部","type":"event"},{"area":46,"id":6,"name":"ソロモン諸島沖","type":"event"},{"area":47,"id":1,"name":"期間限定海域:マニラ沖","type":"event"},{"area":48,"id":1,"name":"オホーツク海千島列島沖","type":"event"},{"area":48,"id":2,"name":"南西諸島沖","type":"event"},{"area":48,"id":3,"name":"四国沖/九州西方五島列島沖","type":"event"},{"area":48,"id":4,"name":"小笠原諸島沖","type":"event"},{"area":48,"id":5,"name":"ニューブリテン島沖 ソロモン諸島西部沖","type":"event"},{"area":48,"id":6,"name":"ソロモン諸島沖","type":"event"},{"area":48,"id":7,"name":"ソロモン諸島沖 サンタ・クルーズ諸島沖","type":"event"},{"area":49,"id":1,"name":"地中海マルタ島沖","type":"event"},{"area":49,"id":2,"name":"バレンツ海","type":"event"},{"area":49,"id":3,"name":"ノルウェー北岬沖/北極海","type":"event"},{"area":49,"id":4,"name":"ルソン島沖/オルモック沖","type":"event"},{"area":50,"id":1,"name":"台湾/南沙諸島/比島方面沖","type":"event"},{"area":50,"id":2,"name":"ソロモン方面/レンネル島沖","type":"event"},{"area":50,"id":3,"name":"タサファロング泊地沖","type":"event"},{"area":50,"id":4,"name":"ラバウル沖/ビスマルク諸島沖/ソロモン諸島沖","type":"event"},{"area":50,"id":5,"name":"アイアンボトムサウンド","type":"event"},{"area":51,"id":1,"name":"アレクサンドリア沖/クレタ島沖","type":"event"},{"area":51,"id":2,"name":"地中海/マルタ島沖/ティレニア海","type":"event"},{"area":51,"id":3,"name":"ジブラルタル沖/地中海/マルタ島沖","type":"event"},{"area":52,"id":1,"name":"三陸沖/北海道根室半島沖","type":"event"},{"area":52,"id":2,"name":"昭南方面～本土航路","type":"event"},{"area":52,"id":3,"name":"八丈島沖/房総半島東方沖","type":"event"},{"area":53,"id":1,"name":"九州沖/南西諸島方面","type":"event"},{"area":53,"id":2,"name":"高雄警備府～比島北部沖","type":"event"},{"area":53,"id":3,"name":"関東/太平洋沖","type":"event"}]

Operations operationsFromJson(String str) =>
    Operations.fromJson(json.decode(str));

String operationsToJson(Operations data) => json.encode(data.toJson());

class Operations {
  Operations({
    List<Operation>? operation,
  }) {
    _operation = operation;
  }

  Operations.fromJson(dynamic json) {
    if (json['operation'] != null) {
      _operation = [];
      json['operation'].forEach((v) {
        _operation?.add(Operation.fromJson(v));
      });
    }
  }

  List<Operation>? _operation;

  List<Operation>? get operation => _operation;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_operation != null) {
      map['operation'] = _operation?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// area : 1
/// id : 1
/// name : "鎮守府正面海域"
/// type : "normal"

Operation operationFromJson(String str) => Operation.fromJson(json.decode(str));

String operationToJson(Operation data) => json.encode(data.toJson());

class Operation {
  Operation({
    int? area,
    int? id,
    String? name,
    String? type,
  }) {
    _area = area;
    _id = id;
    _name = name;
    _type = type;
  }

  Operation.fromJson(dynamic json) {
    _area = json['area'];
    _id = json['id'];
    _name = json['name'];
    _type = json['type'];
  }

  int? _area;
  int? _id;
  String? _name;
  String? _type;

  int? get area => _area;

  int? get id => _id;

  String? get name => _name;

  String? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area'] = _area;
    map['id'] = _id;
    map['name'] = _name;
    map['type'] = _type;
    return map;
  }
}

void main() async {
  var url = Uri.parse(
      "https://raw.githubusercontent.com/AndyZhuAZ/kcdata/main/json/map.json");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var ops = operationsFromJson(response.body);
    print("Number of operations: ${ops.operation?.length}.");
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}
