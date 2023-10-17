import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:project_withprovider/view/todopage.dart';
import 'package:project_withprovider/widgets/buttons.dart';

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

  final GoRouter _router = GoRouter(initialLocation: "/", routes: [
    GoRoute(path: "/", builder: ((context, state) => const AnimationPage())),
    GoRoute(path: "/second", builder: ((context, state) =>  ListDetailsWidget())),
  ]);
}

class AnimationPage extends StatelessWidget {
  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 500,
          width: 400,
          child: Lottie.asset('assets/animation/animation_3.json',
              fit: BoxFit.cover, height: 30),
        )
      ]),
      floatingActionButton: ButtonPage(
        icon: Icons.arrow_forward,
        onpressed: () => GoRouter.of(context).go("/second"),
        backgroundColor:const Color.fromARGB(255, 5, 26, 43)
        // hi
      ),
    );
  }
}
