class DrawerModel {
  Null? id;
  String? name;
  String? label;
  String? lastModifiedDate;

  DrawerModel({this.id, this.name, this.label, this.lastModifiedDate});

  DrawerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    label = json['label'];
    lastModifiedDate = json['lastModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['label'] = this.label;
    data['lastModifiedDate'] = this.lastModifiedDate;
    return data;
  }
}
