class CancelUrl {
  String? href;

  CancelUrl({this.href});

  CancelUrl.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['href'] = href;
    return data;
  }
}
