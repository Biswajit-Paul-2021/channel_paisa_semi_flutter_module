// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'dashboard_bloc.dart';

class DashboardState {
  final String authToken;
  final int selectedPos;
  final List<Client> clients;
  final List<Offer> offers;
  final bool isLoading;
  final bool isListLoading;
  final int page;
  final int lastPage;
  final String channelPartnerId;

  bool get hasLastPageReached => page == lastPage;

  DashboardState({
    this.authToken = "",
    this.selectedPos = 0,
    this.clients = const [],
    this.offers = const [],
    this.isLoading = false,
    this.isListLoading = false,
    this.page = 0,
    this.lastPage = 0,
    this.channelPartnerId,
  });

  DashboardState copyWith({
    final String authToken,
    final int selectedPos,
    final List<Client> clients,
    final List<Offer> offers,
    final bool isLoading,
    final bool isListLoading,
    final int page,
    final int lastPage,
    final String channelPartnerId,
  }) {
    return DashboardState(
      authToken: authToken ?? this.authToken,
      selectedPos: selectedPos ?? this.selectedPos,
      clients: clients ?? this.clients,
      offers: offers ?? this.offers,
      isListLoading: isListLoading ?? this.isListLoading,
      isLoading: isLoading ?? this.isLoading,
      page: page ?? this.page,
      lastPage: lastPage ?? this.lastPage,
      channelPartnerId: channelPartnerId ?? this.channelPartnerId,
    );
  }
}
