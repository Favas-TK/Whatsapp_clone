import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.messages,
    this.profile,
    this.isGroup,
    this.updatedAt,
  });

  String? name;
  String? messages;
  String? profile;
  bool? isGroup;
  String? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        messages: json["messages"],
        profile: json["profile"],
        isGroup: json["isGroup"],
        updatedAt: json["updatedAt"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "messages": messages,
        "profile": profile,
        "isGroup": isGroup,
        "updatedAt": updatedAt,
      };
}
