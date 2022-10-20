class RecommendedExperts {
  String? name;
  String? title;
  double? rate;
  String? image;
  String? id;

  RecommendedExperts({
    this.name,
    this.title,
    this.rate,
    this.image,
    this.id,
  });

  RecommendedExperts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    rate = json['rate'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
