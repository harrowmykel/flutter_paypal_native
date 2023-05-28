class Name {
  String? fullName;
  String? givenName;
  String? familyName;

  Name({this.fullName, this.givenName, this.familyName});

  Name.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    givenName = json['givenName'];
    familyName = json['familyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['fullName'] = fullName;
    data['givenName'] = givenName;
    data['familyName'] = familyName;
    return data;
  }
}
