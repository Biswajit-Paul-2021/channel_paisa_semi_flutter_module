// To parse this JSON data, do
//
//     final offers = offersFromJson(jsonString);

import 'dart:convert';

class Offers {
  Offers({
    this.success,
    this.offers,
  });

  final bool success;
  final OffersClass offers;

  Offers copyWith({
    bool success,
    OffersClass offers,
  }) =>
      Offers(
        success: success ?? this.success,
        offers: offers ?? this.offers,
      );

  factory Offers.fromRawJson(String str) => Offers.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        success: json["success"],
        offers: OffersClass.fromJson(json["offers"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "offers": offers.toJson(),
      };
}

class OffersClass {
  OffersClass({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  final int currentPage;
  final List<Offer> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final dynamic nextPageUrl;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  OffersClass copyWith({
    int currentPage,
    List<Offer> data,
    String firstPageUrl,
    int from,
    int lastPage,
    String lastPageUrl,
    dynamic nextPageUrl,
    int perPage,
    dynamic prevPageUrl,
    int to,
    int total,
  }) =>
      OffersClass(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory OffersClass.fromRawJson(String str) =>
      OffersClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OffersClass.fromJson(Map<String, dynamic> json) => OffersClass(
        currentPage: json["current_page"],
        data: List<Offer>.from(json["data"].map((x) => Offer.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
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
    this.gaPriority,
    this.representativeDetails,
    this.showSubscriptionButton,
    this.showUploadButton,
  });

  final String path;
  final String monthYear;
  final String states;
  final String status;
  final int priority;
  final int organizationId;
  final int teamId;
  final int clientId;
  final int gaPriority;
  final RepresentativeDetails representativeDetails;
  final bool showSubscriptionButton;
  final bool showUploadButton;

  Offer copyWith({
    String path,
    String monthYear,
    String states,
    String status,
    int priority,
    int organizationId,
    int teamId,
    int clientId,
    int gaPriority,
    RepresentativeDetails representativeDetails,
    bool showSubscriptionButton,
    bool showUploadButton,
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
        gaPriority: gaPriority ?? this.gaPriority,
        representativeDetails:
            representativeDetails ?? this.representativeDetails,
        showSubscriptionButton:
            showSubscriptionButton ?? this.showSubscriptionButton,
        showUploadButton: showUploadButton ?? this.showUploadButton,
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
        gaPriority: json["ga_priority"],
        representativeDetails:
            RepresentativeDetails.fromJson(json["representative_details"]),
        showSubscriptionButton: json["show_subscription_button"],
        showUploadButton: json["show_upload_button"],
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
        "ga_priority": gaPriority,
        "representative_details": representativeDetails.toJson(),
        "show_subscription_button": showSubscriptionButton,
        "show_upload_button": showUploadButton,
      };
}

class RepresentativeDetails {
  RepresentativeDetails({
    this.name,
    this.mobile,
  });

  final String name;
  final String mobile;

  RepresentativeDetails copyWith({
    String name,
    String mobile,
  }) =>
      RepresentativeDetails(
        name: name ?? this.name,
        mobile: mobile ?? this.mobile,
      );

  factory RepresentativeDetails.fromRawJson(String str) =>
      RepresentativeDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RepresentativeDetails.fromJson(Map<String, dynamic> json) =>
      RepresentativeDetails(
        name: json["name"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
      };
}
