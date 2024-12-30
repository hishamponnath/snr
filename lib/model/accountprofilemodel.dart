class AccountProfileModel {
  dynamic alterId;
  String? pid;
  String? name;
  String? alias;
  String? userPid;
  String? userName;
  dynamic description;
  String? accountTypePid;
  String? accountTypeName;
  dynamic gstRegistrationType;
  dynamic locationRadius;
  String? address;
  String? city;
  dynamic location;
  dynamic pin;
  dynamic latitude;
  dynamic longitude;
  dynamic phone1;
  dynamic phone2;
  dynamic email1;
  dynamic email2;
  dynamic whatsAppNo;
  dynamic defaultPriceLevelPid;
  dynamic defaultPriceLevelName;
  String? accountStatus;
  bool? importStatus;
  dynamic creditDays;
  dynamic creditLimit;
  dynamic contactPerson;
  bool? activated; // This field should be a bool, but stored as int (0/1)
  String? lastModifiedDate;
  String? createdDate;
  dynamic leadToCashStage;
  dynamic tinNo;
  dynamic closingBalance;
  dynamic defaultDiscountPercentage;
  dynamic trimChar;
  bool?
      hasDefaultAccountInventory; // This field is bool, but stored as int (0/1)
  bool?
      promptStockLocationInventory; // This field is bool, but stored as int (0/1)
  String? dataSourceType;
  dynamic stateName;
  dynamic countryName;
  dynamic districtName;
  dynamic geoTaggingType;
  dynamic geoTaggedTime;
  dynamic geoTaggedUserName;
  dynamic geoTaggedUserPid;
  dynamic geoTaggedUserLogin;
  String? customerId;
  dynamic countryId;
  dynamic customerCode;
  dynamic stateId;
  dynamic districtId;
  dynamic mailingName;
  dynamic employeeName;
  dynamic minVoucherDate;
  dynamic answers;
  dynamic geoTaggingStatus;
  String? territory;
  bool? isImportStatus; // This field is bool, but stored as int (0/1)
  dynamic aitrichCode;

  AccountProfileModel({
    this.alterId,
    this.pid,
    this.name,
    this.alias,
    this.userPid,
    this.userName,
    this.description,
    this.accountTypePid,
    this.accountTypeName,
    this.gstRegistrationType,
    this.locationRadius,
    this.address,
    this.city,
    this.location,
    this.pin,
    this.latitude,
    this.longitude,
    this.phone1,
    this.phone2,
    this.email1,
    this.email2,
    this.whatsAppNo,
    this.defaultPriceLevelPid,
    this.defaultPriceLevelName,
    this.accountStatus,
    this.importStatus,
    this.creditDays,
    this.creditLimit,
    this.contactPerson,
    this.activated,
    this.lastModifiedDate,
    this.createdDate,
    this.leadToCashStage,
    this.tinNo,
    this.closingBalance,
    this.defaultDiscountPercentage,
    this.trimChar,
    this.hasDefaultAccountInventory,
    this.promptStockLocationInventory,
    this.dataSourceType,
    this.stateName,
    this.countryName,
    this.districtName,
    this.geoTaggingType,
    this.geoTaggedTime,
    this.geoTaggedUserName,
    this.geoTaggedUserPid,
    this.geoTaggedUserLogin,
    this.customerId,
    this.countryId,
    this.customerCode,
    this.stateId,
    this.districtId,
    this.mailingName,
    this.employeeName,
    this.minVoucherDate,
    this.answers,
    this.geoTaggingStatus,
    this.territory,
    this.isImportStatus,
    this.aitrichCode,
  });

  AccountProfileModel.fromJson(Map<String, dynamic> json) {
    alterId = json['alterId'];
    pid = json['pid'];
    name = json['name'];
    alias = json['alias'];
    userPid = json['userPid'];
    userName = json['userName'];
    description = json['description'];
    accountTypePid = json['accountTypePid'];
    accountTypeName = json['accountTypeName'];
    gstRegistrationType = json['gstRegistrationType'];
    locationRadius = json['locationRadius'];
    address = json['address'];
    city = json['city'];
    location = json['location'];
    pin = json['pin'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone1 = json['phone1'];
    phone2 = json['phone2'];
    email1 = json['email1'];
    email2 = json['email2'];
    whatsAppNo = json['whatsAppNo'];
    defaultPriceLevelPid = json['defaultPriceLevelPid'];
    defaultPriceLevelName = json['defaultPriceLevelName'];
    accountStatus = json['accountStatus'];
    importStatus =
        json['importStatus'] == 1; // Convert int to bool (0 = false, 1 = true)
    creditDays = json['creditDays'];
    creditLimit = json['creditLimit'];
    contactPerson = json['contactPerson'];
    activated =
        json['activated'] == 1; // Convert int to bool (0 = false, 1 = true)
    lastModifiedDate = json['lastModifiedDate'];
    createdDate = json['createdDate'];
    leadToCashStage = json['leadToCashStage'];
    tinNo = json['tinNo'];
    closingBalance = json['closingBalance'];
    defaultDiscountPercentage = json['defaultDiscountPercentage'];
    trimChar = json['trimChar'];
    hasDefaultAccountInventory = json['hasDefaultAccountInventory'] ==
        1; // Convert int to bool (0 = false, 1 = true)
    promptStockLocationInventory = json['promptStockLocationInventory'] ==
        1; // Convert int to bool (0 = false, 1 = true)
    dataSourceType = json['dataSourceType'];
    stateName = json['stateName'];
    countryName = json['countryName'];
    districtName = json['districtName'];
    geoTaggingType = json['geoTaggingType'];
    geoTaggedTime = json['geoTaggedTime'];
    geoTaggedUserName = json['geoTaggedUserName'];
    geoTaggedUserPid = json['geoTaggedUserPid'];
    geoTaggedUserLogin = json['geoTaggedUserLogin'];
    customerId = json['customerId'];
    countryId = json['countryId'];
    customerCode = json['customerCode'];
    stateId = json['stateId'];
    districtId = json['districtId'];
    mailingName = json['mailingName'];
    employeeName = json['employeeName'];
    minVoucherDate = json['minVoucherDate'];
    answers = json['answers'];
    geoTaggingStatus = json['geoTaggingStatus'];
    territory = json['territory'];
    isImportStatus = json['isImportStatus'] ==
        1; // Convert int to bool (0 = false, 1 = true)
    aitrichCode = json['aitrichCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['alterId'] = alterId;
    data['pid'] = pid;
    data['name'] = name;
    data['alias'] = alias;
    data['userPid'] = userPid;
    data['userName'] = userName;
    data['description'] = description;
    data['accountTypePid'] = accountTypePid;
    data['accountTypeName'] = accountTypeName;
    data['gstRegistrationType'] = gstRegistrationType;
    data['locationRadius'] = locationRadius;
    data['address'] = address;
    data['city'] = city;
    data['location'] = location;
    data['pin'] = pin;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone1'] = phone1;
    data['phone2'] = phone2;
    data['email1'] = email1;
    data['email2'] = email2;
    data['whatsAppNo'] = whatsAppNo;
    data['defaultPriceLevelPid'] = defaultPriceLevelPid;
    data['defaultPriceLevelName'] = defaultPriceLevelName;
    data['accountStatus'] = accountStatus;
    data['importStatus'] = importStatus == true
        ? 1
        : 0; // Convert bool to int (true = 1, false = 0)
    data['creditDays'] = creditDays;
    data['creditLimit'] = creditLimit;
    data['contactPerson'] = contactPerson;
    data['activated'] =
        activated == true ? 1 : 0; // Convert bool to int (true = 1, false = 0)
    data['lastModifiedDate'] = lastModifiedDate;
    data['createdDate'] = createdDate;
    data['leadToCashStage'] = leadToCashStage;
    data['tinNo'] = tinNo;
    data['closingBalance'] = closingBalance;
    data['defaultDiscountPercentage'] = defaultDiscountPercentage;
    data['trimChar'] = trimChar;
    data['hasDefaultAccountInventory'] = hasDefaultAccountInventory == true
        ? 1
        : 0; // Convert bool to int (true = 1, false = 0)
    data['promptStockLocationInventory'] = promptStockLocationInventory == true
        ? 1
        : 0; // Convert bool to int (true = 1, false = 0)
    data['dataSourceType'] = dataSourceType;
    data['stateName'] = stateName;
    data['countryName'] = countryName;
    data['districtName'] = districtName;
    data['geoTaggingType'] = geoTaggingType;
    data['geoTaggedTime'] = geoTaggedTime;
    data['geoTaggedUserName'] = geoTaggedUserName;
    data['geoTaggedUserPid'] = geoTaggedUserPid;
    data['geoTaggedUserLogin'] = geoTaggedUserLogin;
    data['customerId'] = customerId;
    data['countryId'] = countryId;
    data['customerCode'] = customerCode;
    data['stateId'] = stateId;
    data['districtId'] = districtId;
    data['mailingName'] = mailingName;
    data['employeeName'] = employeeName;
    data['minVoucherDate'] = minVoucherDate;
    data['answers'] = answers;
    data['geoTaggingStatus'] = geoTaggingStatus;
    data['territory'] = territory;
    data['isImportStatus'] = isImportStatus == true
        ? 1
        : 0; // Convert bool to int (true = 1, false = 0)
    data['aitrichCode'] = aitrichCode;
    return data;
  }
}
