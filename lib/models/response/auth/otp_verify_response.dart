class OtpVerifyResponse {
  int? userId;
  var fullname;
  String? email;
  var profileImage;
  var latitude;
  var longitude;
  var address;
  var phoneNumber;
  String? referralCode;
  int? points;
  Authentication? authentication;

  OtpVerifyResponse(
      {this.userId,
      this.fullname,
      this.email,
      this.profileImage,
      this.latitude,
      this.longitude,
      this.address,
      this.phoneNumber,
      this.referralCode,
      this.points,
      this.authentication});

  OtpVerifyResponse.fromJson(Map<String, dynamic> json) {
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
    authentication = json['authentication'] != null
        ? new Authentication.fromJson(json['authentication'])
        : null;
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
    if (this.authentication != null) {
      data['authentication'] = this.authentication!.toJson();
    }
    return data;
  }
}

class Authentication {
  String? accessToken;
  int? expiresAt;
  String? refreshToken;

  Authentication({this.accessToken, this.expiresAt, this.refreshToken});

  Authentication.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    expiresAt = json['expiresAt'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accessToken'] = this.accessToken;
    data['expiresAt'] = this.expiresAt;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
