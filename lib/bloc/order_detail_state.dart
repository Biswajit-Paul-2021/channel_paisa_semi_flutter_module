part of 'order_detail_bloc.dart';

class OrderDetailState {
  final Order order;
  OrderDetailState({this.order});

  factory OrderDetailState.reset() => OrderDetailState(order: null);
}
