import 'operation.dart';

class SubMission {
  int id;
  Operation op;
  bool state;

  @override
  String toString() {
    return 'SubMission{id: $id, op: $op, state: $state}';
  }

  SubMission(this.id, this.op, this.state);
}

class Mission {
  String id;
  String title;
  List<SubMission> todo;

  Mission(this.id, this.title, this.todo);

  @override
  String toString() {
    return 'Mission{id: $id, title: $title, todo: $todo}';
  }
}

var sub1 = SubMission(1, op1, false);
var mis1 = Mission("B2", "鎮守府正面海域を護れ！", [sub1]);

void main() {
  print(mis1);
}
