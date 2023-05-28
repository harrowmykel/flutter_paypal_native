class Email {
  String? value;

  Email({this.value});

  Email.fromJson(Map<String, dynamic> json) {
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['value'] = value;
    return data;
  }
}
