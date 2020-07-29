import 'package:auto_route/auto_route_annotations.dart';
import 'package:eletecapp/pages/pages.dart';
import 'package:flutter/material.dart';

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    CupertinoRoute(page: Authentication, initial: true),
    MaterialRoute<Widget>(
      path: '/users/:id',
      page: UserPage,
      children: [
        AdaptiveRoute(path: '/', page: UserProfilePage),
        AdaptiveRoute(path: '/photo', page: UserPhotoPage),
        AdaptiveRoute(
          path: '/post',
          page: UserPostPage,
        ),
      ],
    ),
    // AdaptiveRoute<bool>(path: "/login", page: LoginScreen),
    // AdaptiveRoute(path: '*', page: UnknownRouteScreen)
  ],
)
class $Router {}
