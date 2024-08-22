import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';
import 'package:check_point/src/user_info/widgets/custom_dialog.dart';
import 'package:check_point/src/login_page/ui/login_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MyInheritedWidget.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 240,
              height: 100,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0, top: 42.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      const Divider(
                        color: Colors.black,
                      ),
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
                              text: '${user.data.length}',
                              style: const TextStyle(
                                  fontSize: 22, color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
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
                  backgroundColor: const Color.fromARGB(255, 183, 164, 136),
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
                    permission = await Geolocator.requestPermission();
                    if (permission == LocationPermission.denied) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog(
                            title: 'Помилка',
                            content: 'Дозвіл на геопозицію не надано.',
                          );
                        },
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog(
                            title: 'Успіх',
                            content: 'Дозвіл на геопозицію надано.',
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
                          content: 'Дозвіл на геопозицію вже надано.',
                        );
                      },
                    );
                  }
                },
                child: const Text('Перевірити\nНеобхідні дозволи',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 32.0),
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
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginPage()), (route) => false);
          },
          child: const Text('Вийти з аккаунту', style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}
