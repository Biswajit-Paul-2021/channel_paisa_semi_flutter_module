// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_detail_bloc.dart';

class OrderDetailState {
  final Order order;
  final bool isLoading;
  final bool isAccepted;
  final String errorTxt;
  final String authToken;
  OrderDetailState({
    this.order,
    this.isLoading,
    this.isAccepted,
    this.errorTxt,
    this.authToken,
  });

  factory OrderDetailState.reset() => OrderDetailState(
        order: null,
        isLoading: false,
        isAccepted: false,
        errorTxt: '',
        authToken: '',
      );

  OrderDetailState copyWith({
    Order order,
    bool isLoading,
    bool isAccepted,
    String errorTxt,
    String authToken,
  }) {
    return OrderDetailState(
      order: order ?? this.order,
      isLoading: isLoading ?? this.isLoading,
      isAccepted: isAccepted ?? this.isAccepted,
      errorTxt: errorTxt ?? this.errorTxt,
      authToken: authToken ?? this.authToken,
    );
  }
}
