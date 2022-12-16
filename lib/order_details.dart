import 'package:channel_paisa_semi_flutter_module/bloc/order_detail_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/consent_pending.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/order_item_details.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/reciever_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final platform = MethodChannel("com.channelpaisa.channelpaisa");

class OrderDetails extends StatefulWidget {
  OrderDetails();
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with WidgetsBindingObserver {
  Map arguments;

  final temp = {
    "id": 1,
    "order_uuid": null,
    "creator_name": "Nagendra Kumar Pandey",
    "channel_partner_id": 5867,
    "firm_name": "AADYA  AGENCY",
    "gst_no": "10ARCPR7446J2ZO",
    "dl_no": "23/23A",
    "mobile": "9507188084",
    "whatsapp": "8286505176",
    "ordered_organizations": [
      {
        "organization_code": "Encube",
        "selected_suppliers": [
          {
            "supplier_uuid": "633bcdfdb9ffd27ed99cf657",
            "name": "Arya Medical Agency",
            "pan_no": "ADSPK4206B",
            "gst_no": "10ADSPK4206B1Z6",
            "dl_no": "781",
            "supplier_type": "stockist",
            "priority": 1
          },
          {
            "supplier_uuid": "633bcdf7b9ffd27ed99cf039",
            "name": "Bansal Drug Agency",
            "pan_no": "ADWPB5057H",
            "gst_no": "10ADWPB5057H1ZO",
            "dl_no": "7",
            "supplier_type": "stockist",
            "priority": 2
          },
          {
            "supplier_uuid": "633bcdf7b9ffd27ed99cf060",
            "name": "BIHAR MEDICO",
            "pan_no": "AJKPS3801Q",
            "gst_no": "10AJKPS3801Q1ZZ",
            "dl_no": "103",
            "supplier_type": "stockist",
            "priority": 3
          }
        ],
        "ordered_items": [
          {
            "brand_name": "Soframycin",
            "product_name": "Soframycin Skin Cream 30gm",
            "uom": "box",
            "quantity": 3,
            "unit_price": 890.0,
            "division_code": "ICON_TX",
            "organization_code": "Encube"
          },
          {
            "brand_name": "Soframycin2",
            "product_name": "Soframycin Skin Cream 30gm",
            "uom": "box",
            "quantity": 3,
            "unit_price": 220.0,
            "division_code": "ICON_TX",
            "organization_code": "Encube"
          }
        ]
      },
    ],
    "delivery_address": {
      "line": "4, Moti Bhai Desai Chawl, Ganesh Nagar, Dahisar-E",
      "landmark": "Suvidha Medical",
      "district": "MUMBAI",
      "city": "MUMBAI",
      "pin_code": 400068,
      "state": "MAHARASHTRA",
      "country": "India",
      "lat": "19.24739447",
      "long": "72.86544331"
    }
  };

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_onNativeCallHandler);
    // BlocProvider.of<OrderDetailBloc>(context)
    //     .add(OrderDetailGetDataEvent(Order.fromJson(temp)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await platform.invokeMethod("pop");
          },
        ),
        title: Text('Order Details'),
      ),
      body: BlocBuilder<OrderDetailBloc, OrderDetailState>(
        builder: (context, state) {
          return state.order == null
              ? Center(child: CircularProgressIndicator())
              : ListView(
                  children: [
                    RecieverDetails(),
                    OrderItemDetails(),
                    Visibility(
                      visible: state.order.orderUuid == null,
                      child: ConsentPending(),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Future<dynamic> _onNativeCallHandler(MethodCall call) async {
    switch (call.method) {
      case "reset":
        final map = call.arguments as Map;
        final order = Order.fromJson(map);
        BlocProvider.of<OrderDetailBloc>(context)
            .add(OrderDetailGetDataEvent(order));
        break;
      default:
    }
  }
}
