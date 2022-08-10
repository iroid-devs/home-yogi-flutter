class UserDetailResponse {
  int? userId;
  String? fullname;
  String? email;
  String? profileImage;
  double? latitude;
  double? longitude;
  String? address;
  String? phoneNumber;
  String? referralCode;
  int? points;

  UserDetailResponse(
      {this.userId,
      this.fullname,
      this.email,
      this.profileImage,
      this.latitude,
      this.longitude,
      this.address,
      this.phoneNumber,
      this.referralCode,
      this.points});

  UserDetailResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullname = json['fullname'];
    email = json['email'];
    profileImage = json['profileImage'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    phoneNumber = json['phoneNumber'];
    referralCode = json['referralCode'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['profileImage'] = this.profileImage;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['phoneNumber'] = this.phoneNumber;
    data['referralCode'] = this.referralCode;
    data['points'] = this.points;
    return data;
  }
}
