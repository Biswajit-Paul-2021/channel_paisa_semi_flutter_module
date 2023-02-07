import 'package:channel_paisa_semi_flutter_module/bloc/dashboard_bloc/dashboard_bloc.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:channel_paisa_semi_flutter_module/constants/app_strings.dart';
import 'package:channel_paisa_semi_flutter_module/widgets/view_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  }

  String name = '';

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
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                            child: Center(
                                child: Text(
                              'View All',
                              style: TextStyle(
                                color: AppColors.primaryDarkColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
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
                        return ListView.builder(
                          itemBuilder: (ctx, pos) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                state.offers[pos].path,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          itemCount: state.offers.length,
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
}
