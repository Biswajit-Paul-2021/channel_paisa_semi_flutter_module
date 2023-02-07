import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/consent_pending.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/order_item_details.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/reciever_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_bloc/order_detail_bloc.dart';

final platformOrder = MethodChannel(AppStrings.methodChannelOrder);

class OrderDetails extends StatefulWidget {
  OrderDetails();
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with WidgetsBindingObserver {
  Map arguments;

  @override
  void initState() {
    super.initState();
    platformOrder.setMethodCallHandler(_onNativeCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () async {
            await platformOrder.invokeMethod(AppStrings.pop);
          },
        ),
        title: Text(AppStrings.orderDetails),
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
                      visible: state.order.orderStatus == 'on_hold',
                      child: ConsentPending(),
                    ),
                    Visibility(
                      visible: state.order.orderStatus == 'rejected',
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 16,
                        ),
                        child: Text(
                          'Consent Rejected.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.rejectedColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
        },
      ),
    );
  }

  Future<dynamic> _onNativeCallHandler(MethodCall call) async {
    switch (call.method) {
      case AppStrings.reset:
        final map = call.arguments as Map;
        final order = Order.fromJson(map['order']);
        final authToken = map['auth-token'];
        BlocProvider.of<OrderDetailBloc>(context)
            .add(OrderDetailGetDataEvent(order, authToken));
        break;
      default:
    }
  }
}
