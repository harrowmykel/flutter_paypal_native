class MapHelper {
  Map<String, dynamic>? _map;

  String getString(name, {String defaultVal = ""}) {
    return map[name] ?? defaultVal;
  }

  int getInt(name, {int defaultVal = 0}) {
    return map[name] ?? defaultVal;
  }

  Map<String, dynamic>? getMap(name, {Map<String, dynamic>? defaultVal}) {
    return (map[name] ?? defaultVal);
  }

  List<dynamic>? getList(name, {List<dynamic>? defaultVal}) {
    return map[name] ?? defaultVal;
  }

  List<Map<String, dynamic>>? getMapList(
    name, {
    List<Map<String, dynamic>>? defaultVal,
  }) {
    return map[name] ?? defaultVal;
  }

  ///returns a non null map
  Map<String, dynamic> get map {
    return _map ?? {};
  }

  ///set a non null map
  void setMap(Map<String, dynamic> mapV) {
    _map = mapV;
  }
}
