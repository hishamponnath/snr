class AssociationModel {
  String?
      alterId; // Changed from Null? to String? if alterId is expected to be a String
  String? accountProfilePid;
  String? accountProfileName;
  String? locationPid;
  String? locationName;
  String? lastModifiedDate;
  String? customerId; // Changed from Null? to String?

  AssociationModel({
    this.alterId,
    this.accountProfilePid,
    this.accountProfileName,
    this.locationPid,
    this.locationName,
    this.lastModifiedDate,
    this.customerId,
  });

  // From JSON
  AssociationModel.fromJson(Map<String, dynamic> json) {
    alterId = json['alterId'] as String?; // Ensure proper casting
    accountProfilePid = json['accountProfilePid'] as String?;
    accountProfileName = json['accountProfileName'] as String?;
    locationPid = json['locationPid'] as String?;
    locationName = json['locationName'] as String?;
    lastModifiedDate = json['lastModifiedDate'] as String?;
    customerId = json['customer_id'] as String?; // Ensure proper key mapping
  }

  // To JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alterId'] = alterId;
    data['accountProfilePid'] = accountProfilePid;
    data['accountProfileName'] = accountProfileName;
    data['locationPid'] = locationPid;
    data['locationName'] = locationName;
    data['lastModifiedDate'] = lastModifiedDate;
    data['customer_id'] = customerId;
    return data;
  }
}
