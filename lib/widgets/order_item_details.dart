import 'package:channel_paisa_semi_flutter_module/bloc/order_detail_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderItemDetails extends StatelessWidget {
  const OrderItemDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final order = BlocProvider.of<OrderDetailBloc>(context).state.order;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8),
          Text(
            'Order Details',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16),
          buildOrderDetail(order),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildOrderDetail(Order order) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primaryDarkColor),
      ),
      child: Column(
        children: List.generate(
          order.orderedOrganizations.length,
          (index) {
            return Column(
              children: [
                ItemView(
                  orderedOrganization: order.orderedOrganizations[index],
                ),
                Visibility(
                  child: SizedBox(height: 8),
                  visible: index != order.orderedOrganizations.length - 1,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
