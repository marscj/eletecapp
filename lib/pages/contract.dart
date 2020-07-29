import 'package:auto_route/auto_route.dart';
import 'package:eletecapp/I18n/i18n.dart';
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
    // return BlocProvider<ContractBloc>(
    //     create: (context) => ContractBloc(context),
    //     child: ExtendedNavigator(
    //       initialRoute: ContractPageRoutes.contractListPage,
    //     ));
    return ExtendedNavigator(
      initialRoute: ContractPageRoutes.contractListPage,
    );
  }
}

class ContractListPage extends StatefulWidget {
  @override
  _ContractListPageState createState() => _ContractListPageState();
}

class _ContractListPageState extends State<ContractListPage> {
  @override
  void dispose() {
    print('abc');
    super.dispose();
    print('def');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(Localization.of(context).contract),
          leading: BackButton(onPressed: () {
            context.navigator.root.pop();
          }),
        ),
        body: Container());
  }

  // BlocBuilder<ContractBloc, ContractState>(
  //         builder: (context, state) {
  //           ContractBloc bloc = BlocProvider.of<ContractBloc>(context);

  //           return SmartRefresher(
  //             enablePullDown: true,
  //             enablePullUp: state.list.length < state.totalCount,
  //             header: WaterDropHeader(),
  //             footer: CustomFooter(
  //               builder: (BuildContext context, LoadStatus mode) {
  //                 Widget body;
  //                 if (mode == LoadStatus.idle) {
  //                   body = Text("pull up load");
  //                 } else if (mode == LoadStatus.loading) {
  //                   body = CupertinoActivityIndicator();
  //                 } else if (mode == LoadStatus.failed) {
  //                   body = Text("Load Failed!Click retry!");
  //                 } else if (mode == LoadStatus.canLoading) {
  //                   body = Text("release to load more");
  //                 } else {
  //                   body = Text("No more Data");
  //                 }
  //                 return Container(
  //                   height: 55.0,
  //                   child: Center(child: body),
  //                 );
  //               },
  //             ),
  //             controller: bloc.refreshController,
  //             onRefresh: () => bloc.add(ContractRefreshList()),
  //             onLoading: () => bloc.add(ContractLoadList()),
  //             child: ListView.separated(
  //               padding: const EdgeInsets.symmetric(horizontal: 8),
  //               separatorBuilder: (_, index) => new Divider(),
  //               itemBuilder: (c, i) => Container(),
  //               itemCount: state.list.length,
  //             ),
  //           );
  //         },
  //       )
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
