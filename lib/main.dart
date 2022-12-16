import 'package:channel_paisa_semi_flutter_module/bloc/order_detail_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_theme.dart';
import 'package:channel_paisa_semi_flutter_module/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(
      BlocProvider(
        create: (context) => OrderDetailBloc(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: OrderDetails(),
    );
  }
}
