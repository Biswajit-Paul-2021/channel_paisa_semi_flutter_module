// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:flutter/material.dart';

class ItemView extends StatelessWidget {
  final OrderedOrganization orderedOrganization;
  ItemView({
    Key key,
    @required this.orderedOrganization,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: AppColors.primaryColor,
          padding: EdgeInsets.all(4),
          child: Text(
            orderedOrganization.organizationCode,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: List.generate(
                orderedOrganization.orderedItems.length,
                (index) {
                  final item = orderedOrganization.orderedItems[index];
                  return Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          item.productName,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        subtitle: Text(
                            '₹${item.unitPrice.toStringAsFixed(2)} x${item.quantity}'),
                        trailing: Text(
                          'x${item.quantity} ${item.uom}',
                          style: TextStyle(color: AppColors.primaryDarkColor),
                        ),
                      ),
                      Visibility(
                        child: Divider(thickness: 1.1),
                        visible: index !=
                            orderedOrganization.orderedItems.length - 1,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Selected Suppliers',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Divider(thickness: 2),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: List.generate(
              orderedOrganization.selectedSuppliers.length,
              (index) {
                final supplier = orderedOrganization.selectedSuppliers[index];
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    child: Text(
                      (index + 1).toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  ),
                  title: Text(
                    supplier.name ?? '',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
