// To parse this JSON data, do
//
//     final offers = offersFromJson(jsonString);

import 'dart:convert';

class Offers {
  Offers({
    this.success,
    this.offers,
    this.total,
    this.lastPage,
  });

  final bool success;
  final List<Offer> offers;
  final int total;
  final int lastPage;

  Offers copyWith({
    bool success,
    List<Offer> offers,
    int total,
    int lastPage,
  }) =>
      Offers(
        success: success ?? this.success,
        offers: offers ?? this.offers,
        total: total ?? this.total,
        lastPage: lastPage ?? this.lastPage,
      );

  factory Offers.fromRawJson(String str) => Offers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        success: json["success"],
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
        total: json["total"],
        lastPage: json["last_page"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
        "total": total,
        "last_page": lastPage,
      };
}

class Offer {
  Offer({
    this.path,
    this.monthYear,
    this.states,
    this.status,
    this.priority,
    this.organizationId,
    this.teamId,
    this.clientId,
  });

  final String path;
  final String monthYear;
  final String states;
  final String status;
  final int priority;
  final int organizationId;
  final int teamId;
  final int clientId;

  Offer copyWith({
    String path,
    String monthYear,
    String states,
    String status,
    int priority,
    int organizationId,
    int teamId,
    int clientId,
  }) =>
      Offer(
        path: path ?? this.path,
        monthYear: monthYear ?? this.monthYear,
        states: states ?? this.states,
        status: status ?? this.status,
        priority: priority ?? this.priority,
        organizationId: organizationId ?? this.organizationId,
        teamId: teamId ?? this.teamId,
        clientId: clientId ?? this.clientId,
      );

  factory Offer.fromRawJson(String str) => Offer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        path: json["path"],
        monthYear: json["month_year"],
        states: json["states"],
        status: json["status"],
        priority: json["priority"],
        organizationId: json["organization_id"],
        teamId: json["team_id"],
        clientId: json["client_id"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "month_year": monthYear,
        "states": states,
        "status": status,
        "priority": priority,
        "organization_id": organizationId,
        "team_id": teamId,
        "client_id": clientId,
      };
}
