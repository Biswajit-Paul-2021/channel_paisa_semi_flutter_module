import 'package:channel_paisa_semi_flutter_module/constants/app_theme.dart';
import 'package:channel_paisa_semi_flutter_module/order_details.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme().theme,
      home: OrderDetails(),
    );
  }
}
