class Area {
  String name;
  int id;
  bool event;

  @override
  String toString() {
    return '$name';
  }

  Area(this.name, this.id, this.event);
}

Area area1 = Area("鎮守府海域", 1, false);
