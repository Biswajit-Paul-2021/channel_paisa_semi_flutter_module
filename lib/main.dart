import 'package:channel_paisa_semi_flutter_module/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_theme.dart';
import 'package:channel_paisa_semi_flutter_module/dashboard_fragment.dart';
import 'package:channel_paisa_semi_flutter_module/order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/order_bloc/order_detail_bloc.dart';

const platform = MethodChannel(AppStrings.methodChannel);

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor:
        AppColors.primaryDarkColor, //or set color with: Color(0xFF0000FF)
  ));
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrderDetailBloc(),
        ),
        BlocProvider(
          create: (context) => DashboardBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget showWidget;

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_onPlatformCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().theme,
      home: showWidget ?? DashboardFragment(),
    );
  }

  Future<dynamic> _onPlatformCallHandler(MethodCall call) async {
    switch (call.method) {
      case 'open':
        final args = call.arguments as Map;
        if (args['widget'] == 'order') {
          showWidget = OrderDetails();
        } else if (args['widget'] == 'dashboard') {
          showWidget = DashboardFragment();
        } else {
          showWidget = Container();
        }
        setState(() {});
        break;
      default:
    }
  }
}
