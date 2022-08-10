class RewardsResponse {
  int? rewardId;
  String? name;
  String? description;
  String? code;
  int? discount;
  int? buyPrice;
  String? image;
  bool? isLocked;
  int? requiredLevel;
  int? expiresAt;

  RewardsResponse(
      {this.rewardId,
        this.name,
        this.description,
        this.code,
        this.discount,
        this.buyPrice,
        this.image,
        this.isLocked,
        this.requiredLevel,
        this.expiresAt});

  RewardsResponse.fromJson(Map<String, dynamic> json) {
    rewardId = json['rewardId'];
    name = json['name'];
    description = json['description'];
    code = json['code'];
    discount = json['discount'];
    buyPrice = json['buyPrice'];
    image = json['image'];
    isLocked = json['isLocked'];
    requiredLevel = json['requiredLevel'];
    expiresAt = json['expiresAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rewardId'] = this.rewardId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['code'] = this.code;
    data['discount'] = this.discount;
    data['buyPrice'] = this.buyPrice;
    data['image'] = this.image;
    data['isLocked'] = this.isLocked;
    data['requiredLevel'] = this.requiredLevel;
    data['expiresAt'] = this.expiresAt;
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