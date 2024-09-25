import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';
import 'package:check_point/src/user_info/widgets/custom_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:check_point/providers/login_provider.dart';
import 'package:check_point/providers/documents_provider.dart';

class UserPage extends StatelessWidget {
  /// use provider for state management
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: isLandscape ? 200 : 240,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 42.0),
            child: Consumer2<UserProvider, DocumentsProvider>(
              builder: (context, userProvider, documentProvider, child) {
                final user = userProvider.user;
                final documentCount = documentProvider.documentCount;
                return isLandscape
                    ? Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '${user.name} ${user.name}',
                                  style: const TextStyle(fontSize: 28),
                                  textAlign: TextAlign.center,
                                ),
                                const Divider(color: Colors.black),
                                RichText(
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                  text: TextSpan(
                                    children: [
                                      const TextSpan(
                                        text:
                                            'Кількість створених документів за сьогодні: ',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '$documentCount',
                                        style: const TextStyle(
                                            fontSize: 22, color: Colors.red),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(color: Colors.black),
                                const Text(
                                  'Дата прийняття на роботу: 20.08.2024',
                                  style: TextStyle(fontSize: 22),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 1,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                'https://picsum.photos/200',
                                width: 160,
                                height: 220,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://picsum.photos/200',
                                  width: 160,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '${user.name} ${user.name}',
                                      style: const TextStyle(fontSize: 28),
                                      textAlign: TextAlign.center,
                                    ),
                                    const Divider(color: Colors.black),
                                    RichText(
                                      textAlign: TextAlign.center,
                                      softWrap: true,
                                      text: TextSpan(
                                        children: [
                                          const TextSpan(
                                            text:
                                                'Кількість створених документів за сьогодні: ',
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '$documentCount',
                                            style: const TextStyle(
                                                fontSize: 22,
                                                color: Colors.red),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Divider(color: Colors.black),
                                    const Text(
                                      'Дата прийняття на роботу: 20.08.2024',
                                      style: TextStyle(fontSize: 22),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 80),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor:
                                    const Color.fromARGB(255, 183, 164, 136),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15.0, horizontal: 15.0),
                              ),
                              onPressed: () async {
                                LocationPermission permission =
                                    await Geolocator.checkPermission();
                                if (permission == LocationPermission.denied) {
                                  permission =
                                      await Geolocator.requestPermission();
                                  if (permission == LocationPermission.denied) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialog(
                                          title: 'Помилка',
                                          content:
                                              'Дозвіл на геопозицію не надано.',
                                        );
                                      },
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const CustomDialog(
                                          title: 'Успіх',
                                          content:
                                              'Дозвіл на геопозицію надано.',
                                        );
                                      },
                                    );
                                  }
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const CustomDialog(
                                        title: 'Успіх',
                                        content:
                                            'Дозвіл на геопозицію вже надано.',
                                      );
                                    },
                                  );
                                }
                              },
                              child: const Text(
                                'Перевірити\nНеобхідні дозволи',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 32.0),
              color: const Color.fromARGB(255, 255, 235, 208),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                ),
                onPressed: () {
                  context.goNamed('login');
                },
                child: const Text('Вийти з аккаунту',
                    style: TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
