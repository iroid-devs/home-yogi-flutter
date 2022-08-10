class LevelsTopResponse {
  List<CurrentUserRank>? currentUserRank;
  List<AllUsersRanking>? allUsersRanking;

  LevelsTopResponse({this.currentUserRank, this.allUsersRanking});

  LevelsTopResponse.fromJson(Map<String, dynamic> json) {
    if (json['currentUserRank'] != null) {
      currentUserRank = <CurrentUserRank>[];
      json['currentUserRank'].forEach((v) {
        currentUserRank!.add(new CurrentUserRank.fromJson(v));
      });
    }
    if (json['allUsersRanking'] != null) {
      allUsersRanking = <AllUsersRanking>[];
      json['allUsersRanking'].forEach((v) {
        allUsersRanking!.add(new AllUsersRanking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentUserRank != null) {
      data['currentUserRank'] =
          this.currentUserRank!.map((v) => v.toJson()).toList();
    }
    if (this.allUsersRanking != null) {
      data['allUsersRanking'] =
          this.allUsersRanking!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentUserRank {
  int? userId;
  String? fullname;
  String? profileImage;
  int? points;
  int? rank;

  CurrentUserRank(
      {this.userId, this.fullname, this.profileImage, this.points, this.rank});

  CurrentUserRank.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullname = json['fullname'];
    profileImage = json['profileImage'];
    points = json['points'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['profileImage'] = this.profileImage;
    data['points'] = this.points;
    data['rank'] = this.rank;
    return data;
  }
}

class AllUsersRanking {
  int? userId;
  String? fullname;
  String? profileImage;
  int? points;
  int? rank;

  AllUsersRanking(
      {this.userId, this.fullname, this.profileImage, this.points, this.rank});

  AllUsersRanking.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullname = json['fullname'];
    profileImage = json['profileImage'];
    points = json['points'];
    rank = json['rank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullname'] = this.fullname;
    data['profileImage'] = this.profileImage;
    data['points'] = this.points;
    data['rank'] = this.rank;
    return data;
  }
}

class Meta {
  int? total;
  int? perPage;
  int? totalPage;
  int? currentPage;

  Meta({this.total, this.perPage, this.totalPage, this.currentPage});

  Meta.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    perPage = json['perPage'];
    totalPage = json['totalPage'];
    currentPage = json['currentPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['perPage'] = this.perPage;
    data['totalPage'] = this.totalPage;
    data['currentPage'] = this.currentPage;
    return data;
  }
}



// class LevelsTopResponse {
//   int? userId;
//   String? fullname;
//   String? profileImage;
//   int? points;
//
//   LevelsTopResponse({this.userId, this.fullname, this.profileImage, this.points});
//
//   LevelsTopResponse.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     fullname = json['fullname'];
//     profileImage = json['profileImage'];
//     points = json['points'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['fullname'] = this.fullname;
//     data['profileImage'] = this.profileImage;
//     data['points'] = this.points;
//     return data;
//   }
// }
//
// class Meta {
//   int? total;
//   int? perPage;
//   int? totalPage;
//   int? currentPage;
//
//   Meta({this.total, this.perPage, this.totalPage, this.currentPage});
//
//   Meta.fromJson(Map<String, dynamic> json) {
//     total = json['total'];
//     perPage = json['perPage'];
//     totalPage = json['totalPage'];
//     currentPage = json['currentPage'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['total'] = this.total;
//     data['perPage'] = this.perPage;
//     data['totalPage'] = this.totalPage;
//     data['currentPage'] = this.currentPage;
//     return data;
//   }
// }