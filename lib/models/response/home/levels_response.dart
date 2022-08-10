class LevelsResponse {
  int? userCurrentLevel;
  String? profileImage;
  int? points;
  String? iconImage;
  List<Levels>? levels;

  LevelsResponse(
      {this.userCurrentLevel,
        this.profileImage,
        this.points,
        this.iconImage,
        this.levels});

  LevelsResponse.fromJson(Map<String, dynamic> json) {
    userCurrentLevel = json['userCurrentLevel'];
    profileImage = json['profileImage'];
    points = json['points'];
    iconImage = json['iconImage'];
    if (json['levels'] != null) {
      levels = <Levels>[];
      json['levels'].forEach((v) {
        levels!.add(new Levels.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userCurrentLevel'] = this.userCurrentLevel;
    data['profileImage'] = this.profileImage;
    data['points'] = this.points;
    data['iconImage'] = this.iconImage;
    if (this.levels != null) {
      data['levels'] = this.levels!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Levels {
  int? level;
  int? minPoints;
  bool? isLocked;
  String? iconImage;

  Levels({this.level, this.minPoints, this.isLocked, this.iconImage});

  Levels.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    minPoints = json['minPoints'];
    isLocked = json['isLocked'];
    iconImage = json['iconImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['minPoints'] = this.minPoints;
    data['isLocked'] = this.isLocked;
    data['iconImage'] = this.iconImage;
    return data;
  }
}