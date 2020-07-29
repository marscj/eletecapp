import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/apis/client.dart';
import 'package:eletecapp/bloc/order_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

// ignore_for_file: close_sinks

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderListBloc>(
      create: (context) => OrderListBloc(context),
      child: BlocBuilder<OrderListBloc, OrderListState>(
        builder: (context, state) {
          OrderListBloc bloc = BlocProvider.of<OrderListBloc>(context);

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.list.length < state.totalCount,
            header: WaterDropHeader(),
            footer: CustomFooter(
              builder: (BuildContext context, LoadStatus mode) {
                Widget body;
                if (mode == LoadStatus.idle) {
                  body = Text("pull up load");
                } else if (mode == LoadStatus.loading) {
                  body = CupertinoActivityIndicator();
                } else if (mode == LoadStatus.failed) {
                  body = Text("Load Failed!Click retry!");
                } else if (mode == LoadStatus.canLoading) {
                  body = Text("release to load more");
                } else {
                  body = Text("No more Data");
                }
                return Container(
                  height: 55.0,
                  child: Center(child: body),
                );
              },
            ),
            controller: bloc.refreshController,
            onRefresh: () => bloc.add(RefreshOrderList()),
            onLoading: () => bloc.add(LoadOrderList()),
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              separatorBuilder: (_, index) => new Divider(),
              itemBuilder: (c, i) => OrderListItem(order: state.list[i]),
              itemCount: state.list.length,
            ),
          );
        },
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  final Order order;

  const OrderListItem({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MaterialColor bgColor = Colors.indigo;

    final List<String> images = [
      'assets/images/ac.png',
      'assets/images/eletectrical.png',
      'assets/images/plumbing.png',
      'assets/images/house.png'
    ];

    return DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              shape: BoxShape.rectangle,
              color: bgColor[200],
            ),
            child: Column(
              children: <Widget>[
                Container(
                    height: 45,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(8)),
                      shape: BoxShape.rectangle,
                      color: bgColor[400],
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('${order.orderID}'),
                          Text(
                              '${Localization.of(context).orderStatus[order.status]}')
                        ])),
                Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    child: ListTile(
                      trailing: Image.asset(images[order.service]),
                      title: Text(
                          '${Localization.of(context).mainInfo[order.service][order.main_info]}'),
                      subtitle: Text(
                          '${Localization.of(context).subInfo[order.service][order.main_info][order.sub_info]} \n${order.create_at}'),
                    ))
              ],
            )));
  }
}

// return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'USER',
//       ),
//     ),
//     body:
//     Theme(
//       data: Theme.of(context).copyWith(
//           primaryColor: Colors.indigo, // app header background
//           secondaryHeaderColor:
//               Colors.indigoAccent, // card header background
//           cardColor: Colors.white, // card field background
//           buttonColor: Colors.indigoAccent, // button background color
//           textTheme: TextTheme(
//             button: TextStyle(color: Colors.indigoAccent), // button text
//             subtitle1: TextStyle(color: Colors.black87), // input text
//             headline6: TextStyle(color: Colors.white), // card header text
//           ),
//           inputDecorationTheme: InputDecorationTheme(
//             labelStyle:
//                 TextStyle(color: Colors.black87), // style for labels
//           ),
//           cardTheme: CardTheme(
//               elevation: 4.0,
//               shape: RoundedRectangleBorder(
//                 side: BorderSide(width: 1, color: Colors.indigo),
//                 borderRadius: BorderRadius.circular(8),
//               ))),
//       child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
//         return BlocProvider<UserFormBloc>(
//             create: (_) => UserFormBloc(context),
//             child: Builder(
//               builder: (formContext) {
//                 return FormBlocListener<UserFormBloc, String, String>(
//                     child: CardSettings(
//                   showMaterialonIOS: true,
//                   labelWidth: 100,
//                   children: [
//                     CardSettingsSection(
//                       header: CardSettingsHeader(
//                         label: 'Infomation',
//                       ),
//                       children: [
//                         CardSettingsText(
//                           label: 'Phone',
//                           initialValue: state.user.username,
//                           enabled: false,
//                           validator: (value) {
//                             if (value == null || value.isEmpty)
//                               return 'Title is required.';
//                           },
//                           onSaved: (value) => title = value,
//                         ),
//                         CardSettingsField(
//                           fieldPadding: null,
//                           labelAlign: null,
//                           requiredIndicator: null,
//                           label: 'First Name',
//                           content: TextFieldBlocBuilder(
//                               textFieldBloc:
//                                   BlocProvider.of<UserFormBloc>(formContext)
//                                       .first_name,
//                               decoration: InputDecoration(
//                                   labelText: 'abc',
//                                   border: UnderlineInputBorder())),
//                         )
//                       ],
//                     )
//                   ],
//                 ));
//               },
//             ));
//       }),
//     ));
