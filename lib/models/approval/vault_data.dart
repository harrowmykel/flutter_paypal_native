class VaultData {
  String? approvalSessionID;
  String? approvalTokenID;

  VaultData({this.approvalSessionID, this.approvalTokenID});

  VaultData.fromJson(Map<String, dynamic> json) {
    approvalSessionID = json['approvalSessionID'];
    approvalTokenID = json['approvalTokenID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['approvalSessionID'] = approvalSessionID;
    data['approvalTokenID'] = approvalTokenID;
    return data;
  }
}
