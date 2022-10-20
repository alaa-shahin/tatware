class CategoryModel {
  String? name;
  String? image;
  String? title;
  String? id;

  CategoryModel({this.name, this.image, this.title, this.id});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    title = json['title'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['title'] = this.title;
    data['id'] = this.id;
    return data;
  }
}
