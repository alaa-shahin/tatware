class CategoryModel {
  String? name;
  String? image;
  String? title;
  String? id;
  bool? selected;

  CategoryModel({
    this.name,
    this.image,
    this.title,
    this.id,
    this.selected,
  });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    title = json['title'];
    id = json['id'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['title'] = this.title;
    data['id'] = this.id;
    data['selected'] = this.selected;
    return data;
  }
}
