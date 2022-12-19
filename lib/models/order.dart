import 'dart:convert';

class Order {
  Order({
    this.id,
    this.orderUuid,
    this.creatorName,
    this.channelPartnerId,
    this.referenceNumber,
    this.orderDate,
    this.firmName,
    this.gstNo,
    this.dlNo,
    this.mobile,
    this.whatsapp,
    this.orderedOrganizations,
    this.deliveryAddress,
    this.orderStatus,
  });

  int id;
  dynamic orderUuid;
  String creatorName;
  String referenceNumber;
  String orderDate;
  int channelPartnerId;
  String firmName;
  String gstNo;
  String dlNo;
  String mobile;
  String whatsapp;
  List<OrderedOrganization> orderedOrganizations;
  DeliveryAddress deliveryAddress;
  String orderStatus;

  Order copyWith({
    int id,
    dynamic orderUuid,
    String creatorName,
    int channelPartnerId,
    String referenceNumber,
    String orderDate,
    String firmName,
    String gstNo,
    String dlNo,
    String mobile,
    String whatsapp,
    List<OrderedOrganization> orderedOrganizations,
    DeliveryAddress deliveryAddress,
    String orderStatus,
  }) =>
      Order(
        id: id ?? this.id,
        orderUuid: orderUuid ?? this.orderUuid,
        creatorName: creatorName ?? this.creatorName,
        channelPartnerId: channelPartnerId ?? this.channelPartnerId,
        referenceNumber: referenceNumber ?? this.referenceNumber,
        orderDate: orderDate ?? this.orderDate,
        firmName: firmName ?? this.firmName,
        gstNo: gstNo ?? this.gstNo,
        dlNo: dlNo ?? this.dlNo,
        mobile: mobile ?? this.mobile,
        whatsapp: whatsapp ?? this.whatsapp,
        orderedOrganizations: orderedOrganizations ?? this.orderedOrganizations,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        orderStatus: orderStatus ?? this.orderStatus,
      );

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<dynamic, dynamic> json) => Order(
        id: json["id"],
        orderUuid: json["order_uuid"],
        creatorName: json["creator_name"],
        channelPartnerId: json["channel_partner_id"],
        referenceNumber: json["reference_number"],
        orderStatus: json["order_status"],
        orderDate: json["order_date"],
        firmName: json["firm_name"],
        gstNo: json["gst_no"],
        dlNo: json["dl_no"],
        mobile: json["mobile"],
        whatsapp: json["whatsapp"],
        orderedOrganizations: List<OrderedOrganization>.from(
            json["ordered_organizations"]
                .map((x) => OrderedOrganization.fromJson(x))),
        deliveryAddress: DeliveryAddress.fromJson(json["delivery_address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_uuid": orderUuid,
        "creator_name": creatorName,
        "channel_partner_id": channelPartnerId,
        "firm_name": firmName,
        "order_status": orderStatus,
        "gst_no": gstNo,
        "dl_no": dlNo,
        "mobile": mobile,
        "reference_number": referenceNumber,
        "order_date": orderDate,
        "whatsapp": whatsapp,
        "ordered_organizations":
            List<dynamic>.from(orderedOrganizations.map((x) => x.toJson())),
        "delivery_address": deliveryAddress.toJson(),
      };
}

class DeliveryAddress {
  DeliveryAddress({
    this.line,
    this.landmark,
    this.district,
    this.city,
    this.pinCode,
    this.state,
    this.country,
    this.lat,
    this.long,
  });

  String line;
  String landmark;
  String district;
  String city;
  int pinCode;
  String state;
  String country;
  String lat;
  String long;

  DeliveryAddress copyWith({
    String line,
    String landmark,
    String district,
    String city,
    int pinCode,
    String state,
    String country,
    String lat,
    String long,
  }) =>
      DeliveryAddress(
        line: line ?? this.line,
        landmark: landmark ?? this.landmark,
        district: district ?? this.district,
        city: city ?? this.city,
        pinCode: pinCode ?? this.pinCode,
        state: state ?? this.state,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        long: long ?? this.long,
      );

  factory DeliveryAddress.fromRawJson(String str) =>
      DeliveryAddress.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DeliveryAddress.fromJson(Map<dynamic, dynamic> json) =>
      DeliveryAddress(
        line: json["line"],
        landmark: json["landmark"],
        district: json["district"],
        city: json["city"],
        pinCode: json["pin_code"],
        state: json["state"],
        country: json["country"],
        lat: json["lat"],
        long: json["long"],
      );

  Map<String, dynamic> toJson() => {
        "line": line,
        "landmark": landmark,
        "district": district,
        "city": city,
        "pin_code": pinCode,
        "state": state,
        "country": country,
        "lat": lat,
        "long": long,
      };
}

class OrderedOrganization {
  OrderedOrganization({
    this.organizationCode,
    this.selectedSuppliers,
    this.orderedItems,
  });

  String organizationCode;
  List<SelectedSupplier> selectedSuppliers;
  List<OrderedItem> orderedItems;

  OrderedOrganization copyWith({
    String organizationCode,
    List<SelectedSupplier> selectedSuppliers,
    List<OrderedItem> orderedItems,
  }) =>
      OrderedOrganization(
        organizationCode: organizationCode ?? this.organizationCode,
        selectedSuppliers: selectedSuppliers ?? this.selectedSuppliers,
        orderedItems: orderedItems ?? this.orderedItems,
      );

  factory OrderedOrganization.fromRawJson(String str) =>
      OrderedOrganization.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderedOrganization.fromJson(Map<dynamic, dynamic> json) =>
      OrderedOrganization(
        organizationCode: json["organization_code"],
        selectedSuppliers: List<SelectedSupplier>.from(
            json["selected_suppliers"]
                .map((x) => SelectedSupplier.fromJson(x))),
        orderedItems: List<OrderedItem>.from(
            json["ordered_items"].map((x) => OrderedItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "organization_code": organizationCode,
        "selected_suppliers":
            List<dynamic>.from(selectedSuppliers.map((x) => x.toJson())),
        "ordered_items":
            List<dynamic>.from(orderedItems.map((x) => x.toJson())),
      };
}

class OrderedItem {
  OrderedItem({
    this.brandName,
    this.productName,
    this.uom,
    this.quantity,
    this.unitPrice,
    this.divisionCode,
    this.organizationCode,
  });

  String brandName;
  String productName;
  String uom;
  int quantity;
  double unitPrice;
  String divisionCode;
  String organizationCode;

  OrderedItem copyWith({
    String brandName,
    String productName,
    String uom,
    int quantity,
    double unitPrice,
    String divisionCode,
    String organizationCode,
  }) =>
      OrderedItem(
        brandName: brandName ?? this.brandName,
        productName: productName ?? this.productName,
        uom: uom ?? this.uom,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        divisionCode: divisionCode ?? this.divisionCode,
        organizationCode: organizationCode ?? this.organizationCode,
      );

  factory OrderedItem.fromRawJson(String str) =>
      OrderedItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderedItem.fromJson(Map<dynamic, dynamic> json) => OrderedItem(
        brandName: json["brand_name"],
        productName: json["product_name"],
        uom: json["uom"],
        quantity: json["quantity"],
        unitPrice: json["unit_price"],
        divisionCode: json["division_code"],
        organizationCode: json["organization_code"],
      );

  Map<String, dynamic> toJson() => {
        "brand_name": brandName,
        "product_name": productName,
        "uom": uom,
        "quantity": quantity,
        "unit_price": unitPrice,
        "division_code": divisionCode,
        "organization_code": organizationCode,
      };
}

class SelectedSupplier {
  SelectedSupplier({
    this.supplierUuid,
    this.name,
    this.panNo,
    this.gstNo,
    this.dlNo,
    this.supplierType,
    this.priority,
  });

  String supplierUuid;
  String name;
  String panNo;
  String gstNo;
  String dlNo;
  String supplierType;
  int priority;

  SelectedSupplier copyWith({
    String supplierUuid,
    String name,
    String panNo,
    String gstNo,
    String dlNo,
    String supplierType,
    int priority,
  }) =>
      SelectedSupplier(
        supplierUuid: supplierUuid ?? this.supplierUuid,
        name: name ?? this.name,
        panNo: panNo ?? this.panNo,
        gstNo: gstNo ?? this.gstNo,
        dlNo: dlNo ?? this.dlNo,
        supplierType: supplierType ?? this.supplierType,
        priority: priority ?? this.priority,
      );

  factory SelectedSupplier.fromRawJson(String str) =>
      SelectedSupplier.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SelectedSupplier.fromJson(Map<dynamic, dynamic> json) =>
      SelectedSupplier(
        supplierUuid: json["supplier_uuid"],
        name: json["name"],
        panNo: json["pan_no"],
        gstNo: json["gst_no"],
        dlNo: json["dl_no"],
        supplierType: json["supplier_type"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "supplier_uuid": supplierUuid,
        "name": name,
        "pan_no": panNo,
        "gst_no": gstNo,
        "dl_no": dlNo,
        "supplier_type": supplierType,
        "priority": priority,
      };
}
