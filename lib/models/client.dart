// To parse this JSON data, do
//
//     final client = clientFromJson(jsonString);

import 'dart:convert';

class Client {
  Client({
    this.id,
    this.name,
    this.shortCode,
    this.state,
    this.status,
    this.description,
    this.websiteLink,
    this.logoLink,
  });

  final int id;
  final String name;
  final String shortCode;
  final String state;
  final String status;
  final String description;
  final String websiteLink;
  final String logoLink;

  Client copyWith({
    int id,
    String name,
    String shortCode,
    String state,
    String status,
    String description,
    String websiteLink,
    String logoLink,
  }) =>
      Client(
        id: id ?? this.id,
        name: name ?? this.name,
        shortCode: shortCode ?? this.shortCode,
        state: state ?? this.state,
        status: status ?? this.status,
        description: description ?? this.description,
        websiteLink: websiteLink ?? this.websiteLink,
        logoLink: logoLink ?? this.logoLink,
      );

  factory Client.fromRawJson(String str) => Client.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        id: json["id"],
        name: json["name"],
        shortCode: json["short_code"],
        state: json["state"],
        status: json["status"],
        description: json["description"],
        websiteLink: json["website_link"],
        logoLink: json["logo_link"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_code": shortCode,
        "state": state,
        "status": status,
        "description": description,
        "website_link": websiteLink,
        "logo_link": logoLink,
      };
}
