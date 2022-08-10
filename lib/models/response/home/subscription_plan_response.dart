class SubscriptionPlansResponse {
  int? planId;
  Null? productId;
  String? title;
  String? description;
  int? duration;
  int? originalPrice;
  int? price;
  String? features;

  SubscriptionPlansResponse(
      {this.planId,
        this.productId,
        this.title,
        this.description,
        this.duration,
        this.originalPrice,
        this.price,
        this.features});

  SubscriptionPlansResponse.fromJson(Map<String, dynamic> json) {
    planId = json['planId'];
    productId = json['productId'];
    title = json['title'];
    description = json['description'];
    duration = json['duration'];
    originalPrice = json['originalPrice'];
    price = json['price'];
    features = json['features'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['planId'] = this.planId;
    data['productId'] = this.productId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['duration'] = this.duration;
    data['originalPrice'] = this.originalPrice;
    data['price'] = this.price;
    data['features'] = this.features;
    return data;
  }
}