@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    CupertinoRoute(page: Authentication, initial: true),
    MaterialRoute<void>(
      path: '/users/:id',
      page: UserPage,
      children: [
        AdaptiveRoute(path: '/photo', page: UserPhotoPage),
        AdaptiveRoute(
          path: '/post',
          page: UserEditPage,
        ),
      ],
    ),
    // AdaptiveRoute<bool>(path: "/login", page: LoginScreen),
    // AdaptiveRoute(path: '*', page: UnknownRouteScreen)
  ],
)
class $Routers {}
