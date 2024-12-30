class UserModel {
  String? idToken;

  UserModel({this.idToken});

  UserModel.fromJson(Map<String, dynamic> json) {
    idToken = json['id_token'];
  }

  get name => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_token'] = this.idToken;
    return data;
  }
}
