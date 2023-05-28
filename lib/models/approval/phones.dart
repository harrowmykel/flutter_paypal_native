class Phones {
  String? number;

  Phones({this.number});

  Phones.fromJson(Map<String, dynamic> json) {
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['number'] = number;
    return data;
  }
}
