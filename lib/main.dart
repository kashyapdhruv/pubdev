import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pubdev/routes.dart';


void main() {
  runApp(ProviderScope
    (child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Pub_dev',
      routeInformationParser: Approutes.router.routeInformationParser,
      routeInformationProvider: Approutes.router.routeInformationProvider,
      routerDelegate: Approutes.router.routerDelegate,
    );
  }
}

