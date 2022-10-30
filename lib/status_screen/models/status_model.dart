// To parse this JSON data, do
//
//     final staatus = staatusFromJson(jsonString);

import 'dart:convert';

Staatus staatusFromJson(String str) => Staatus.fromJson(json.decode(str));

String staatusToJson(Staatus data) => json.encode(data.toJson());

class Staatus {
    Staatus({
        this.name,
        this.status,
        this.updatedAt,
    });

    String? name;
    String ?status;
    String ?updatedAt;

    factory Staatus.fromJson(Map<String, dynamic> json) => Staatus(
        name: json["name"],
        status: json["status"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
        "updatedAt": updatedAt,
    };
}
