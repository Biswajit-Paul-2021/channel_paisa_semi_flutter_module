import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:channel_paisa_semi_flutter_module/models/client.dart';
import 'package:channel_paisa_semi_flutter_module/models/offers.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState());

  // final clientApiUrl = 'http://stageapi.channelpaisa.com/api/v4/clients';
  final clientApiUrl = 'https://api.channelpaisa.com/api/v4/clients';

  final offerApiUrlAuthority = 'stageapi.channelpaisa.com';
  // final offerApiUrlAuthority = 'api.channelpaisa.com';
  final offerApiUrlUnencodedPath = 'api/v4/offers';

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is SetAuthDashboardEvent) {
      yield state.copyWith(
        authToken: event.authtoken,
        channelPartnerId: event.channelPartnerId,
      );
      add(GetClientListDashboardEvent());
      add(GetOfferDashboardEvent(1));
    } else if (event is GetClientListDashboardEvent) {
      if (state.clients.isEmpty) {
        yield state.copyWith(isLoading: true);
        try {
          final response = await http.get(
            clientApiUrl,
            headers: {'auth-token': state.authToken},
          );
          if (response.statusCode == 200) {
            final body = jsonDecode(response.body);
            final clients = body['clients']['data'] as List;
            final convertedClientList =
                clients.map((e) => Client.fromJson(e)).toList();
            yield state.copyWith(
                clients: convertedClientList, isLoading: false);
          } else {
            yield state.copyWith(isLoading: false);
          }
        } catch (e) {
          yield state.copyWith(isLoading: false);
        }
      }
    } else if (event is ChangeClientDashboardEvent) {
      yield state.copyWith(selectedPos: event.pos);
      add(GetOfferDashboardEvent(1));
    } else if (event is GetOfferDashboardEvent) {
      if (event.page == 1) {
        yield state.copyWith(isListLoading: true, offers: []);
      }
      try {
        final params = {
          'month_year':
              '${DateTime.now().year}-${DateTime.now().month < 10 ? DateTime.now().month.toString().padLeft(2, '0') : DateTime.now().month.toString()}',
          'with_contact_person': '1'
        };
        if (state.selectedPos != 0) {
          params.addAll(
              {'client_id': '${state.clients[state.selectedPos - 1].id}'});
        }
        if (event.page != 1) {
          params.addAll({'page': event.page.toString()});
        }
        //!! TODO change to https while production
        // final uri = Uri.http(
        //   offerApiUrlAuthority,
        //   offerApiUrlUnencodedPath,
        //   params,
        // );
        final uri = Uri.https(
          offerApiUrlAuthority,
          offerApiUrlUnencodedPath,
          params,
        );
        final response = await http.get(
          uri,
          headers: {'auth-token': state.authToken},
        );
        if (response.statusCode == 200) {
          final offers = Offers.fromRawJson(response.body);
          yield state.copyWith(
            isListLoading: false,
            offers: List.from(state.offers, growable: true)
              ..addAll(offers.offers.data),
            page: event.page,
            lastPage: offers.offers.lastPage,
          );
        }
      } catch (e) {
        yield state.copyWith(isListLoading: false);
      }
    }
  }
}
