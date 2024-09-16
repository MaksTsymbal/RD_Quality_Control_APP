import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:check_point/src/login_page/ui/login_page.dart';
import 'package:check_point/src/main_page/ui/main_page.dart';
import 'package:check_point/src/create_document_page/ui/create_document_page.dart';
import 'package:check_point/src/user_info/ui/user_info_page.dart';
import 'package:check_point/src/main_page/data/info_model.dart';

class AppRouter {
  final GoRouter _router;

  AppRouter()
      : _router = GoRouter(
          initialLocation: '/login',
          routes: [
            GoRoute(
              path: '/login',
              name: 'login',
              builder: (context, state) => const LoginPage(),
            ),
            GoRoute(
              path: '/user_page',
              name: 'user_page',
              builder: (context, state) => const UserPage(),
            ),
            GoRoute(
              path: '/main/:name',
              name: 'main',
              builder: (context, state) {
                final name = state.pathParameters['name']!;
                return MainPage(name: name);
              },
            ),
            GoRoute(
              path: '/create_document',
              name: 'create_document',
              builder: (context, state) {
                final extra = state.extra as Map<String, Object>?;
                final name = extra?['name'] as String?;
                final data = extra?['data'] as List<InfoModel>?;
                return CreateQualityControllResultPage(
                    name: name!, data: data!);
              },
            ),
          ],
          errorPageBuilder: (context, state) => MaterialPage(
            key: state.pageKey,
            child: Scaffold(
              appBar: AppBar(title: const Text('Error')),
              body: Center(child: Text(state.error.toString())),
            ),
          ),
        );

  GoRouter get router => _router;
}
