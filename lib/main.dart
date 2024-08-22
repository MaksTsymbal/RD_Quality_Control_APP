import 'package:flutter/material.dart';
import 'package:check_point/src/login_page/ui/login_page.dart';
import 'package:check_point/src/main_page/ui/main_page.dart';
import 'package:check_point/src/create_document_page/ui/create_document_page.dart';
import 'package:check_point/src/user_info/ui/user_info_page.dart';
import 'package:check_point/src/main_page/data/info_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check-Point',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/user_page': (context) => const UserPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'main') {
          final args = settings.arguments as String;
          return MaterialPageRoute(
            builder: (context) {
              return MainPage(name: args);
            },
          );
        } else if (settings.name == '/create_document') {
          final args = settings.arguments as Map<String, dynamic>;
          final String name = args['name'] as String;
          final List<InfoModel> data = args['data'] as List<InfoModel>;
          return MaterialPageRoute(
            builder: (context) {
              return CreateQualityControllResultPage(name: name, data: data);
            },
          );
        }
        return null;
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
