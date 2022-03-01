class Area {
  String name;
  int id;

  @override
  String toString() {
    return '$name';
  }

  Area(this.name, this.id);
}

Area area1 = Area("鎮守府海域", 1);
