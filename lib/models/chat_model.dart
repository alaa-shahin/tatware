class ChatModel {
  String? message;
  bool? isMe;
  String? id;

  ChatModel({this.message, this.isMe, this.id});

  ChatModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isMe = json['is_me'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['is_me'] = this.isMe;
    data['id'] = this.id;
    return data;
  }
}
