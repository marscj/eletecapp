import 'package:auto_route/auto_route_annotations.dart';
import 'package:country_code_picker/country_localizations.dart';
import 'package:eletecapp/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_map_location_picker/generated/i18n.dart'
    as location_picker;

import 'package:eletecapp/router/old_router.dart';
import 'package:eletecapp/I18n/i18n.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class EletecApp extends StatefulWidget {
  @override
  State<EletecApp> createState() => _EletecAppState();
}

class _EletecAppState extends State<EletecApp> {
  @override
  Widget build(BuildContext context) => BlocListener<AppBloc, AppState>(
      listener: (_, __) {},
      child: BlocBuilder<AppBloc, AppState>(builder: (context, state) {
        return MaterialApp(
          title: 'Eletec',
          locale: state.locale,
          localizationsDelegates: const [
            location_picker.S.delegate,
            Localization.delegate,
            RefreshLocalizations.delegate,
            CountryLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const <Locale>[
            Locale('en', ''),
            Locale('ar', ''),
          ],
          // onGenerateRoute: Router.instance.generator,

          theme: ThemeData(
              primarySwatch: Colors.indigo,
              accentColor: Colors.indigoAccent,
              scaffoldBackgroundColor: Colors.grey[200],
              buttonTheme: ButtonThemeData(
                  buttonColor: Colors.indigoAccent,
                  hoverColor: Colors.indigo,
                  textTheme: ButtonTextTheme.primary),
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  color: Colors.grey[200],
                  iconTheme: IconThemeData(color: Colors.indigoAccent),
                  textTheme: GoogleFonts.righteousTextTheme(
                    Theme.of(context).textTheme.apply(
                        displayColor: Colors.indigoAccent,
                        bodyColor: Colors.indigoAccent),
                  ),
                  brightness: Brightness.light),
              dividerColor: Colors.grey,
              textTheme: GoogleFonts.righteousTextTheme(
                Theme.of(context).textTheme,
              ),
              highlightColor: Colors.indigoAccent,
              hoverColor: Colors.indigoAccent.withOpacity(0.04),
              splashColor: Colors.indigoAccent),
        );
      }));
}
