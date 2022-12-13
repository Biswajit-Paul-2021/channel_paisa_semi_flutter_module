import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OrderDetails extends StatefulWidget {
  OrderDetails();
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails>
    with WidgetsBindingObserver {
  Map arguments;
  final platform = MethodChannel("com.channelpaisa.channelpaisa");

  @override
  void initState() {
    super.initState();
    platform.setMethodCallHandler(_onNativeCallHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$arguments',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> _onNativeCallHandler(MethodCall call) async {
    switch (call.method) {
      case "reset":
        setState(() {
          arguments = call.arguments as Map;
        });
        break;
      default:
    }
  }
}
