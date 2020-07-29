import 'package:auto_route/auto_route.dart';
import 'package:card_settings/card_settings.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/apis/client.dart';
import 'package:eletecapp/bloc/contract_bloc.dart';
import 'package:eletecapp/router/router.gr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ContractPage extends StatefulWidget {
  @override
  _ContractPageState createState() => _ContractPageState();
}

class _ContractPageState extends State<ContractPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContractBloc>(
        create: (context) => ContractBloc(context),
        child: ExtendedNavigator(
          name: 'contract',
          initialRoute: ContractPageRoutes.contractListPage,
        ));
  }
}

class ContractListPage extends StatefulWidget {
  @override
  _ContractListPageState createState() => _ContractListPageState();
}

class _ContractListPageState extends State<ContractListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Localization.of(context).contract),
          leading: BackButton(onPressed: () {
            context.navigator.root.pop();
          }),
        ),
        body: BlocBuilder<ContractBloc, ContractState>(
          builder: (context, state) {
            ContractBloc bloc = BlocProvider.of<ContractBloc>(context);

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
              onRefresh: () => bloc.add(ContractRefreshList()),
              onLoading: () => bloc.add(ContractLoadList()),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                separatorBuilder: (_, index) => new Divider(),
                itemBuilder: (c, i) => ContractItem(
                  data: state.list[i],
                ),
                itemCount: state.list.length,
              ),
            );
          },
        ));
  }
}

class ContractItem extends StatefulWidget {
  final Contract data;

  const ContractItem({Key key, this.data}) : super(key: key);

  @override
  _ContractItemState createState() => _ContractItemState();
}

class _ContractItemState extends State<ContractItem> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          secondaryHeaderColor: Colors.indigo, // card header background
          cardColor: Colors.white, // card field background
          buttonColor: Colors.indigo, // button background color
          textTheme: TextTheme(
            button: TextStyle(color: Colors.white), // button text
            subtitle1: TextStyle(color: Colors.black87), // input text
            headline6: TextStyle(color: Colors.white), // card header text
          ),
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: TextStyle(color: Colors.black87), // style for labels
          ),
          cardTheme: CardTheme(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Colors.indigo),
                borderRadius: BorderRadius.circular(8),
              ))),
      child: CardSettings.sectioned(
        showMaterialonIOS: true,
        labelWidth: 100,
        children: [
          CardSettingsSection(
            header: CardSettingsHeader(
              label: '${widget.data.contractID}',
            ),
            children: [
              CardSettingsText(
                label: '${widget.data.contractID}',
                initialValue: '${widget.data.id}',
                validator: (value) {
                  if (value == null || value.isEmpty)
                    return 'Title is required.';
                },
                // onSaved: (value) => title = value,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ContractPost extends StatefulWidget {
  @override
  _ContractPostState createState() => _ContractPostState();
}

class _ContractPostState extends State<ContractPost> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
