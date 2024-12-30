class Attendancemodel {
  dynamic pid;
  dynamic clientTransactionKey;
  dynamic login;
  dynamic userPid;
  dynamic userName;
  dynamic createdDate;
  dynamic completed;
  dynamic remarks;
  dynamic plannedDate;
  dynamic attendanceStatus;
  dynamic latitude;
  dynamic longitude;
  dynamic mnc;
  dynamic mcc;
  dynamic cellId;
  dynamic lac;
  dynamic locationType;
  dynamic location;
  dynamic attendanceSubGroupId;
  dynamic attendanceSubGroupName;
  dynamic attendanceSubGroupCode;
  dynamic taskListAlias;
  dynamic employeeName;
  dynamic towerLocation;
  dynamic towerLatitude;
  dynamic towerLongitude;
  dynamic oodoMeter;
  dynamic companyId;
  dynamic distanceFarePid;
  dynamic imageRefNo;
  dynamic vehicleType;
  dynamic imageButtonVisible;
  dynamic mockLocationStatus;
  dynamic isCompleted;

  Attendancemodel(
      {this.pid,
      this.clientTransactionKey,
      this.login,
      this.userPid,
      this.userName,
      this.createdDate,
      this.completed,
      this.remarks,
      this.plannedDate,
      this.attendanceStatus,
      this.latitude,
      this.longitude,
      this.mnc,
      this.mcc,
      this.cellId,
      this.lac,
      this.locationType,
      this.location,
      this.attendanceSubGroupId,
      this.attendanceSubGroupName,
      this.attendanceSubGroupCode,
      this.taskListAlias,
      this.employeeName,
      this.towerLocation,
      this.towerLatitude,
      this.towerLongitude,
      this.oodoMeter,
      this.companyId,
      this.distanceFarePid,
      this.imageRefNo,
      this.vehicleType,
      this.imageButtonVisible,
      this.mockLocationStatus,
      this.isCompleted});

  Attendancemodel.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    clientTransactionKey = json['clientTransactionKey'];
    login = json['login'];
    userPid = json['userPid'];
    userName = json['userName'];
    createdDate = json['createdDate'];
    completed = json['completed'];
    remarks = json['remarks'];
    plannedDate = json['plannedDate'];
    attendanceStatus = json['attendanceStatus'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    mnc = json['mnc'];
    mcc = json['mcc'];
    cellId = json['cellId'];
    lac = json['lac'];
    locationType = json['locationType'];
    location = json['location'];
    attendanceSubGroupId = json['attendanceSubGroupId'];
    attendanceSubGroupName = json['attendanceSubGroupName'];
    attendanceSubGroupCode = json['attendanceSubGroupCode'];
    taskListAlias = json['taskListAlias'];
    employeeName = json['employeeName'];
    towerLocation = json['towerLocation'];
    towerLatitude = json['towerLatitude'];
    towerLongitude = json['towerLongitude'];
    oodoMeter = json['oodoMeter'];
    companyId = json['companyId'];
    distanceFarePid = json['distanceFarePid'];
    imageRefNo = json['imageRefNo'];
    vehicleType = json['vehicleType'];
    imageButtonVisible = json['imageButtonVisible'];
    mockLocationStatus = json['mockLocationStatus'];
    isCompleted = json['isCompleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['clientTransactionKey'] = clientTransactionKey;
    data['login'] = login;
    data['userPid'] = userPid;
    data['userName'] = userName;
    data['createdDate'] = createdDate;
    data['completed'] = completed;
    data['remarks'] = remarks;
    data['plannedDate'] = plannedDate;
    data['attendanceStatus'] = attendanceStatus;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['mnc'] = mnc;
    data['mcc'] = mcc;
    data['cellId'] = cellId;
    data['lac'] = lac;
    data['locationType'] = locationType;
    data['location'] = location;
    data['attendanceSubGroupId'] = attendanceSubGroupId;
    data['attendanceSubGroupName'] = attendanceSubGroupName;
    data['attendanceSubGroupCode'] = attendanceSubGroupCode;
    data['taskListAlias'] = taskListAlias;
    data['employeeName'] = employeeName;
    data['towerLocation'] = towerLocation;
    data['towerLatitude'] = towerLatitude;
    data['towerLongitude'] = towerLongitude;
    data['oodoMeter'] = oodoMeter;
    data['companyId'] = companyId;
    data['distanceFarePid'] = distanceFarePid;
    data['imageRefNo'] = imageRefNo;
    data['vehicleType'] = vehicleType;
    data['imageButtonVisible'] = imageButtonVisible;
    data['mockLocationStatus'] = mockLocationStatus;
    data['isCompleted'] = isCompleted;
    return data;
  }
}
