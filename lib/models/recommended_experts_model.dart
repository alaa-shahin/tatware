class RecommendedExperts {
  String? name;
  String? title;
  double? rate;
  String? image;
  String? id;
  late bool isFavorite;

  RecommendedExperts({
    this.name,
    this.title,
    this.rate,
    this.image,
    this.id,
    this.isFavorite = false,
  });

  RecommendedExperts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    rate = json['rate'];
    image = json['image'];
    id = json['id'];
    isFavorite = json['isFavorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['rate'] = this.rate;
    data['image'] = this.image;
    data['id'] = this.id;
    data['isFavorite'] = this.isFavorite;
    return data;
  }
}
