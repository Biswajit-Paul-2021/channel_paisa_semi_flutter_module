import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/order_details.dart';
import 'package:flutter/material.dart';

class ConsentPending extends StatelessWidget {
  const ConsentPending({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  platform.invokeMethod("showToast", "Accepted");
                },
                child: Text('Accept',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                    primary: AppColors.primaryDarkColor),
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: SizedBox(
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  platform.invokeMethod("showToast", "Rejected");
                },
                child: Text('Reject',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                style:
                    ElevatedButton.styleFrom(primary: AppColors.rejectedColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}
