class ShopLoginModel{
  bool? status;
  String? message;
  UserDataModel? data;
  ShopLoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = UserDataModel.fromJson(json['data']);
    } else {
      data =null;
    }
  }
}

class UserDataModel {
    int? id;
    String? name;
    String? email;
    String? phone;
    String? image;
    int? points;
    int? credit;
    String? token;
  // UserDataModel({
  //    this.id,
  //    this.name,
  //    this.email,
  //    this.phone,
  //    this.image,
  //    this.points,
  //    this.credit,
  //    this.token,
  // });
  //named constructor
  UserDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}