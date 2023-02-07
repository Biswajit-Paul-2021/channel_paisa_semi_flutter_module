// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'order_detail_bloc.dart';

class OrderDetailState {
  final Order order;
  final bool isLoading;
  final bool isAccepted;
  final String errorTxt;
  final String authToken;
  final String consentMessage;
  OrderDetailState({
    this.order,
    this.isLoading,
    this.isAccepted,
    this.errorTxt,
    this.authToken,
    this.consentMessage,
  });

  factory OrderDetailState.reset() => OrderDetailState(
        order: null,
        isLoading: false,
        isAccepted: false,
        errorTxt: '',
        authToken: '',
        consentMessage: '',
      );

  OrderDetailState copyWith({
    Order order,
    bool isLoading,
    bool isAccepted,
    String errorTxt,
    String authToken,
    String consentMessage,
  }) {
    return OrderDetailState(
      order: order ?? this.order,
      isLoading: isLoading ?? this.isLoading,
      isAccepted: isAccepted ?? this.isAccepted,
      errorTxt: errorTxt ?? this.errorTxt,
      authToken: authToken ?? this.authToken,
      consentMessage: consentMessage ?? this.consentMessage,
    );
  }
}
