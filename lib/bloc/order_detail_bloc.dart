import 'package:bloc/bloc.dart';
import 'package:channel_paisa_semi_flutter_module/models/order.dart';
import 'package:meta/meta.dart';

part 'order_detail_event.dart';
part 'order_detail_state.dart';

class OrderDetailBloc extends Bloc<OrderDetailEvent, OrderDetailState> {
  OrderDetailBloc() : super(OrderDetailState.reset());

  @override
  Stream<OrderDetailState> mapEventToState(OrderDetailEvent event) async* {
    if (event is OrderDetailGetDataEvent) {
      yield OrderDetailState.reset();
      yield OrderDetailState(order: event.order);
    }
  }
}
