import 'operation.dart';

class SubMission {
  int id;
  Operation op;
  bool state;

  @override
  String toString() {
    return '${op.name} $state';
  }

  SubMission(this.id, this.op, this.state);
}

class Mission {
  String id;
  String title;
  List<SubMission>? todo;

  Mission(this.id, this.title);

  @override
  String toString() {
    return 'Mission{id: $id, title: $title, todo: $todo}';
  }
}

List<Mission> missionList = [];



var sub1 = SubMission(1, op1, false);
var mis1 = Mission("B2", "鎮守府正面海域を護れ！");

void main() {
  print(mis1);
}
