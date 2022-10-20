import 'package:go_router/go_router.dart';

import '../index.dart';
import '../modules/getStart_module/getStart_view.dart';
import '../modules/welcom_module/welcome_view.dart';

abstract class Routes {
  static const Welcome = '/';
  static const GetStart = '/getStart';
  static const Home = '/home';
}

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: Routes.Welcome,
      builder: (BuildContext context, GoRouterState state) {
        return WelcomeView();
      },
    ),
    GoRoute(
      path: Routes.GetStart,
      builder: (BuildContext context, GoRouterState state) {
        return GetStartView();
      },
    ),
  ],
);
