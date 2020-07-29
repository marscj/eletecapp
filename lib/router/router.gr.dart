// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../pages/pages.dart';

class Routes {
  static const String authentication = '/';
  static const String _userPage = '/users/:id';
  static String userPage({@required dynamic id}) => '/users/$id';
  static const all = <String>{
    authentication,
    _userPage,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.authentication, page: Authentication),
    RouteDef(
      Routes._userPage,
      page: UserPage,
      generator: UserPageRouter(),
    ),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Authentication: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => Authentication(),
        settings: data,
      );
    },
    UserPage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserPage(),
        settings: data,
      );
    },
  };
}

class UserPageRoutes {
  static const String userProfilePage = '/';
  static const String userPhotoPage = '/photo';
  static const String userEditPage = '/post';
  static const all = <String>{
    userProfilePage,
    userPhotoPage,
    userEditPage,
  };
}

class UserPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(UserPageRoutes.userProfilePage, page: UserProfilePage),
    RouteDef(UserPageRoutes.userPhotoPage, page: UserPhotoPage),
    RouteDef(UserPageRoutes.userEditPage, page: UserPostPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    UserProfilePage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UserProfilePage(),
        settings: data,
      );
    },
    UserPhotoPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UserPhotoPage(),
        settings: data,
      );
    },
    UserPostPage: (data) {
      return buildAdaptivePageRoute<dynamic>(
        builder: (context) => UserPostPage(),
        settings: data,
      );
    },
  };
}
