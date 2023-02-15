import 'dart:developer';

import 'package:channel_paisa_semi_flutter_module/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/subscribe_button.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/view_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recase/recase.dart';

final platformDashboard = MethodChannel(AppStrings.methodChannelDashborad);

class DashboardFragment extends StatefulWidget {
  const DashboardFragment({Key key}) : super(key: key);

  @override
  State<DashboardFragment> createState() => _DashboardFragmentState();
}

class _DashboardFragmentState extends State<DashboardFragment> {
  @override
  void initState() {
    super.initState();
    platformDashboard.setMethodCallHandler(_onNativeCallBack);
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }

  String name = '';
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppStrings.dashboard} back $name'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocConsumer<DashboardBloc, DashboardState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else {
              final clients = state.clients
                  .map(
                    (e) => StatusItem(
                        child: Image.network(e.logoLink),
                        title: e.shortCode.titleCase),
                  )
                  .toList();
              return Column(
                children: [
                  ViewStatus(
                    selectedIndex: state.selectedPos,
                    onTap: (pos) {
                      BlocProvider.of<DashboardBloc>(context)
                          .add(ChangeClientDashboardEvent(pos));
                    },
                    childList: List.generate(clients.length + 1, (index) {
                      if (index == 0) {
                        return StatusItem(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/view_all_icon.png'),
                          ),
                          title: 'View All',
                        );
                      } else {
                        return clients[index - 1];
                      }
                    }),
                  ),
                  Expanded(
                    child: BlocConsumer<DashboardBloc, DashboardState>(
                      listener: (context, state) {},
                      builder: (context, state) {
                        if (state.isListLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state.offers.length == 0) {
                          return Center(
                            child: Text('No Offers found'),
                          );
                        }
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<DashboardBloc>()
                                .add(GetOfferDashboardEvent(1));
                          },
                          child: ListView.builder(
                            controller: scrollController,
                            itemBuilder: (ctx, pos) {
                              if (state.offers.length == pos) {
                                return SizedBox(
                                  height: 60,
                                  width: double.infinity,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Card(
                                    margin: EdgeInsets.only(
                                      top: 4,
                                      left: 4,
                                      right: 4,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                    ),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: Image.network(
                                      state.offers[pos].path,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      bottom: 4,
                                      left: 4,
                                      right: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColors.accentColor,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(12),
                                        bottomRight: Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Visibility(
                                          visible: state.offers[pos]
                                              .showSubscriptionButton,
                                          child: Expanded(
                                            child: SubscribeButton(
                                              onTap: () => log('sdasd'),
                                              title: 'Subscribe Now',
                                            ),
                                          ),
                                        ),
                                        Visibility(
                                          visible: state
                                              .offers[pos].showUploadButton,
                                          child: Expanded(
                                            child: TextButton.icon(
                                              onPressed: () {
                                                platformDashboard.invokeMethod(
                                                  "orderNow",
                                                  Map.of({
                                                    'mobile': state
                                                        .offers[pos]
                                                        .representativeDetails
                                                        .mobile
                                                  }),
                                                );
                                              },
                                              icon: Icon(Icons.call),
                                              label: Text('Order Now'),
                                              style: TextButton.styleFrom(
                                                primary: AppColors.blackColor,
                                                textStyle: GoogleFonts.workSans(
                                                  textStyle: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: AppColors.primaryColor,
                                          width: 1.5,
                                        ),
                                        Visibility(
                                          visible: state
                                              .offers[pos].showUploadButton,
                                          child: Expanded(
                                            child: SubscribeButton(
                                              onTap: () {
                                                platformDashboard
                                                    .invokeMethod("upload");
                                              },
                                              title: 'Upload',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                            itemCount: state.hasLastPageReached
                                ? state.offers.length
                                : state.offers.length + 1,
                          ),
                        );
                      },
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<dynamic> _onNativeCallBack(MethodCall call) async {
    switch (call.method) {
      case AppStrings.reset:
        final args = call.arguments;
        setState(() {
          name = args['name'];
        });
        BlocProvider.of<DashboardBloc>(context).add(
          SetAuthDashboardEvent(args['auth'], args['channel_partner_id']),
        );
        break;
      default:
    }
  }

  void _onScroll() {
    final state = context.read<DashboardBloc>().state;
    if (!state.hasLastPageReached &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      context.read<DashboardBloc>().add(GetOfferDashboardEvent(state.page + 1));
    }
  }
}
