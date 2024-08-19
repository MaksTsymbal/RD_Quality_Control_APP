import 'package:flutter/material.dart';
import 'package:check_point/src/loginPage/ui/login_page.dart';
import 'package:check_point/src/mainPage/ui/main_page.dart';
import 'package:check_point/src/createDocumentPage/ui/create_document_page.dart';

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
        '/create_document': (context) =>
            const CreateQualityControllResultPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == 'main') {
          final args = settings.arguments as String;

          return MaterialPageRoute(
            builder: (context) {
              return MainPage(name: args);
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
