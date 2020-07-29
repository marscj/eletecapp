import 'package:eletecapp/I18n/i18n.dart';
import 'package:eletecapp/bloc/faq_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FaqPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaqBloc>(
        create: (_) => FaqBloc(context),
        child: BlocBuilder<FaqBloc, FaqState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(Localization.of(context).faqs),
              ),
              body: SingleChildScrollView(
                child: Container(
                    child: ExpansionPanelList(
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      state.items[index].isExpanded = !isExpanded;
                    });
                  },
                  children:
                      state.items.map<ExpansionPanel>((ExpansionItem item) {
                    return ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(item.headerValue),
                        );
                      },
                      body: ListTile(
                          title: Text(item.expandedValue),
                          subtitle: Text(
                              'To delete this panel, tap the trash can icon'),
                          trailing: Icon(Icons.delete),
                          onTap: () {
                            setState(() {
                              state.items.removeWhere(
                                  (currentItem) => item == currentItem);
                            });
                          }),
                      isExpanded: item.isExpanded,
                    );
                  }).toList(),
                )),
              ),
            );
          },
        ));
  }
}
