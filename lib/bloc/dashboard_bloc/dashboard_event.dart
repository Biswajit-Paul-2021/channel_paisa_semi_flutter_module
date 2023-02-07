part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {}

class SetAuthDashboardEvent extends DashboardEvent {
  final String authtoken;
  final String channelPartnerId;

  SetAuthDashboardEvent(this.authtoken, this.channelPartnerId);
}

class GetOfferDashboardEvent extends DashboardEvent {
  final int page;
  GetOfferDashboardEvent(this.page);
}

class ChangeClientDashboardEvent extends DashboardEvent {
  final int pos;
  ChangeClientDashboardEvent(this.pos);
}

class GetClientListDashboardEvent extends DashboardEvent {}
