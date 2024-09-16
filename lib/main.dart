import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/login_provider.dart';
import 'package:check_point/providers/documents_provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:check_point/routing/router.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DocumentsProvider()),
        ChangeNotifierProvider(create: (_) => QualityControlDocumentProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Check-Point',
      routerConfig: AppRouter().router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
