part of 'order_detail_bloc.dart';

@immutable
abstract class OrderDetailEvent {}

class OrderDetailResetEvent extends OrderDetailEvent {}

class OrderDetailGetDataEvent extends OrderDetailEvent {
  final Order order;
  OrderDetailGetDataEvent(this.order);
}
