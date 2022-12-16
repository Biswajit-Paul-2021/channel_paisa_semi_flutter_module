import 'package:channel_paisa_semi_flutter_module/bloc/order_detail_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConsentPending extends StatelessWidget {
  const ConsentPending({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderDetailBloc, OrderDetailState>(
      listener: (context, state) {
        if (state.isAccepted) {
          platform.invokeMethod(AppStrings.showToast, "Consent Accepted");
          platform.invokeMethod(AppStrings.popAndRefresh);
        } else if (state.errorTxt.isNotEmpty) {
          platform.invokeMethod(AppStrings.showToast, state.errorTxt);
        }
      },
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OrderDetailBloc>().add(
                                  OrderDetailAcceptEvent(
                                    OrderEvent.accepted,
                                  ),
                                );
                          },
                          child: Text(
                            AppStrings.accepted,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryDarkColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          onPressed: () {
                            context.read<OrderDetailBloc>().add(
                                  OrderDetailAcceptEvent(
                                    OrderEvent.accepted,
                                  ),
                                );
                          },
                          child: Text(
                            AppStrings.rejected,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.rejectedColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}
