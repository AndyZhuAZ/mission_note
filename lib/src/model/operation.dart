import 'area.dart';

class Operation {
  String name;
  int id;
  Area area;
  Operation(this.name, this.id, this.area);

  @override
  String toString() {
    return 'Operation{name: $name, id: ${area.id}-$id, area: $area}';
  }
}

Operation op1 = Operation("鎮守府正面海域", 1, area1);
