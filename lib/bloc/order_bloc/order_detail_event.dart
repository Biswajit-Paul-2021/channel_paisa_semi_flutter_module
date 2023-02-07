part of 'order_detail_bloc.dart';

@immutable
abstract class OrderDetailEvent {}

class OrderDetailResetEvent extends OrderDetailEvent {}

class OrderDetailGetDataEvent extends OrderDetailEvent {
  final Order order;
  final String authToken;
  OrderDetailGetDataEvent(this.order, this.authToken);
}

class OrderDetailAcceptEvent extends OrderDetailEvent {
  final OrderEvent orderEvent;
  OrderDetailAcceptEvent(this.orderEvent);
}

enum OrderEvent { accepted, rejected }
