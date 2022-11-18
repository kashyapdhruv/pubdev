import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pubdev/detail_page.dart';
import 'package:pubdev/home.dart';

class Approutes {
  static final GoRouter router = GoRouter(
      routes: [
        GoRoute(
            path: '/',
          builder: (BuildContext context, GoRouterState state) => HomePage(),
        ),
        GoRoute(
            path: '/Detail',
            builder: (BuildContext context, GoRouterState state) => DetailPage(package: state.queryParams['packageid']!,)
        ),
      ]
  );
}