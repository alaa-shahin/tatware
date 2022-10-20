class OnlineExperts {
  String? name;
  String? image;
  bool? isOnline;
  String? id;

  OnlineExperts({this.name, this.image, this.isOnline, this.id});

  OnlineExperts.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    isOnline = json['isOnline'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['isOnline'] = this.isOnline;
    data['id'] = this.id;
    return data;
  }
}
