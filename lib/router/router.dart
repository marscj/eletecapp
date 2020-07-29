import 'package:fluro/fluro.dart' as fluro;
import 'package:flutter/material.dart';

import 'package:eletecapp/pages/pages.dart';

class Routes {
  static String auth = '/';
  static String user = '/user';
  static String userPhoto = '/user/photo';
  static String userEdit = '/user/edit';

  static void configureRoutes(fluro.Router router) {
    router.define(auth,
        handler: fluro.Handler(handlerFunc: (_, __) => Authentication()));

    router.define(user,
        handler: fluro.Handler(handlerFunc: (_, __) => UserPage()));

    router.define(userPhoto,
        handler: fluro.Handler(handlerFunc: (_, __) => UserPhotoPage()));

    router.define(userEdit,
        handler: fluro.Handler(handlerFunc: (_, __) => UserEditPage()));
  }
}

class Router extends fluro.Router {
  static Router get instance => Router._();

  Router._() {
    Routes.configureRoutes(this);
  }

  @override
  Future navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      fluro.TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    return super.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: transition ?? fluro.TransitionType.cupertino,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }
}
