import 'package:channel_paisa_semi_flutter_module/bloc/order_bloc/order_detail_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecieverDetails extends StatelessWidget {
  const RecieverDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = BlocProvider.of<OrderDetailBloc>(context).state.order;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Text(
            AppStrings.receiverDetails,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          Text(
            order.firmName,
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 8),
          Text(order.deliveryAddress.line),
          SizedBox(height: 8),
          buildIndentificationNoWidget(order),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  Widget buildIndentificationNoWidget(Order order) {
    final titleList = [AppStrings.dlNo, AppStrings.gstNo, AppStrings.contactNo];
    final dataList = [
      order.dlNo ?? 'N/A',
      order.gstNo ?? 'N/A',
      order.mobile ?? 'N/A'
    ];
    return SizedBox(
      child: Column(
        children: List.generate(
            3,
            (index) => SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          titleList[index],
                          style: TextStyle(fontWeight: FontWeight.w400),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          dataList[index],
                          style: TextStyle(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
