// To parse this JSON data, do
//
//     final calling = callingFromJson(jsonString);

import 'dart:convert';

Calling callingFromJson(String str) => Calling.fromJson(json.decode(str));

String callingToJson(Calling data) => json.encode(data.toJson());

class Calling {
  Calling({
    this.name,
    this.profile,
    this.isGroup,
    this.updatedAt,
    this.isIncoming,
    this.isVideoCall,
  });

  String? name;
  String? profile;
  bool? isGroup;
  String? updatedAt;
  bool? isIncoming;
  bool? isVideoCall;

  factory Calling.fromJson(Map<String, dynamic> json) => Calling(
        name: json["name"],
        profile: json["profile"],
        isGroup: json["isGroup"],
        updatedAt: json["updatedAt"],
        isIncoming: json["isIncoming"],
        isVideoCall: json["isVideoCall"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "profile": profile,
        "isGroup": isGroup,
        "updatedAt": updatedAt,
        "isIncoming": isIncoming,
        "isVideoCall": isVideoCall,
      };
}
