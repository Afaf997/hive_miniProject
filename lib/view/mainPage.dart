import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:project_withprovider/view/todopage.dart';


class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(initialLocation: "/second", routes: [
    GoRoute(path: "/second", builder: ((context, state) =>  ListDetailsWidget())),
  ]);
}

