import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(OrderDetailState.reset());
  static const String _apiUrl =
      'http://stageapi.channelpaisa.com/api/v4/orders/consent';
  // static const String _apiUrl = 'https://api.channelpaisa.com/api/v4/orders/consent';
  @override
  Stream<OrderDetailState> mapEventToState(OrderDetailEvent event) async* {
    if (event is OrderDetailGetDataEvent) {
      yield OrderDetailState.reset();
      yield state.copyWith(order: event.order, authToken: event.authToken);
    } else if (event is OrderDetailAcceptEvent) {
      yield state.copyWith(
        errorTxt: '',
        isLoading: true,
        consentMessage: '',
        isAccepted: false,
      );
      try {
        final response = await http.put(
          Uri.parse(
            '$_apiUrl/${state.order.referenceNumber}/'
            '${event.orderEvent == OrderEvent.accepted ? "accepted" : "rejected"}',
          ),
          headers: {'Auth-Token': state.authToken},
        );
        if (response.statusCode == 200) {
          yield state.copyWith(
            errorTxt: '',
            isLoading: false,
            isAccepted: true,
            consentMessage: event.orderEvent == OrderEvent.accepted
                ? 'Consent Accepted'
                : 'Consent Rejected',
          );
        } else {
          yield state.copyWith(
            errorTxt: 'Api request failed. Please try again later',
            isLoading: false,
          );
        }
      } catch (e) {
        log(e.toString());
        yield state.copyWith(
          errorTxt: 'Api request failed. Please try again later',
          isLoading: false,
        );
      }
    }
  }
}
