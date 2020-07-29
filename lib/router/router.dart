import 'package:auto_route/auto_route_annotations.dart';
import 'package:eletecapp/pages/pages.dart';
import 'package:flutter/material.dart';

@MaterialAutoRouter(
  // generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    CupertinoRoute(page: Authentication, initial: true),
    CupertinoRoute<Widget>(
      path: '/users/:id',
      page: UserPage,
      children: [
        CupertinoRoute(path: '/', page: UserProfilePage),
        CupertinoRoute(path: '/photo', page: UserPhotoPage),
        CupertinoRoute(
          path: '/post/:field?',
          page: UserPostPage,
        ),
      ],
    ),
    CupertinoRoute(
      path: '/faqs',
      page: FaqPage,
    ),
    CupertinoRoute(path: '/contract', page: ContractPage, children: [
      CupertinoRoute(path: '/', page: ContractListPage),
      CupertinoRoute(path: '/:id/post', page: ContractPost)
    ])
  ],
)
class $Router {}
