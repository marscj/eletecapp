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
  static const String faqPage = '/faqs';
  static const String contractPage = '/contact';
  static const all = <String>{
    authentication,
    _userPage,
    faqPage,
    contractPage,
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
    RouteDef(Routes.faqPage, page: FaqPage),
    RouteDef(
      Routes.contractPage,
      page: ContractPage,
      generator: ContractPageRouter(),
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
      return CupertinoPageRoute<Widget>(
        builder: (context) => UserPage(),
        settings: data,
      );
    },
    FaqPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => FaqPage(),
        settings: data,
      );
    },
    ContractPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ContractPage(),
        settings: data,
      );
    },
  };
}

class UserPageRoutes {
  static const String userProfilePage = '/';
  static const String userPhotoPage = '/photo';
  static const String _userPostPage = '/post/:field?';
  static String userPostPage({dynamic field = ''}) => '/post/$field';
  static const all = <String>{
    userProfilePage,
    userPhotoPage,
    _userPostPage,
  };
}

class UserPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(UserPageRoutes.userProfilePage, page: UserProfilePage),
    RouteDef(UserPageRoutes.userPhotoPage, page: UserPhotoPage),
    RouteDef(UserPageRoutes._userPostPage, page: UserPostPage),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    UserProfilePage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserProfilePage(),
        settings: data,
      );
    },
    UserPhotoPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserPhotoPage(),
        settings: data,
      );
    },
    UserPostPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserPostPage(),
        settings: data,
      );
    },
  };
}

class ContractPageRoutes {
  static const String contractListPage = '/';
  static const String _contractPost = '/post/:id?';
  static String contractPost({dynamic id = ''}) => '/post/$id';
  static const all = <String>{
    contractListPage,
    _contractPost,
  };
}

class ContractPageRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(ContractPageRoutes.contractListPage, page: ContractListPage),
    RouteDef(ContractPageRoutes._contractPost, page: ContractPost),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    ContractListPage: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ContractListPage(),
        settings: data,
      );
    },
    ContractPost: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => ContractPost(),
        settings: data,
      );
    },
  };
}
