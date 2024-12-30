class TerritoriesModel {
  String? id;
  String? pid;
  String? alterId;
  String? name;
  String? alias;
  String? description;
  String? latitude;
  String? longitude;
  String? locationId;
  bool? activated;
  String? lastModifiedDate;

  TerritoriesModel({
    this.id,
    this.pid,
    this.alterId,
    this.name,
    this.alias,
    this.description,
    this.latitude,
    this.longitude,
    this.locationId,
    this.activated,
    this.lastModifiedDate,
  });

  factory TerritoriesModel.fromJson(Map<String, dynamic> json) {
    return TerritoriesModel(
      id: json['id'] as String?,
      pid: json['pid'] as String?,
      alterId: json['alterId'] as String?,
      name: json['name'] as String?,
      alias: json['alias'] as String?,
      description: json['description'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      locationId: json['locationId'] as String?,
      activated: json['activated'] as bool?,
      lastModifiedDate: json['lastModifiedDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pid': pid,
      'alterId': alterId,
      'name': name,
      'alias': alias,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'locationId': locationId,
      'activated': activated,
      'lastModifiedDate': lastModifiedDate,
    };
  }
}
