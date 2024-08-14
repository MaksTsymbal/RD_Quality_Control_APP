import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../widgets/customSwitcher.dart';
import '../widgets/customDropdown.dart';
class CreateQualityControllResultPage extends StatefulWidget {
  const CreateQualityControllResultPage({super.key});

  @override
  State<CreateQualityControllResultPage> createState() =>
      _CreateQualityControllResultPageState();
}

class _CreateQualityControllResultPageState
    extends State<CreateQualityControllResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: const Text('Результат контролю якості 0001'),
      ),
      body: Center(
        child: Column(
          children: [
            const CustomSwitch(),
            const SizedBox(height: 40),
            CustomDropdown(
              labelText: 'Оберіть позицію номенклатури',
              items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
              onChanged: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              labelText: 'Склад надходження',
              items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
              onChanged: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              labelText: 'Дата надходження товару',
              items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
              onChanged: (value) {
                print(value);
              },
            ),
            const SizedBox(height: 20),
            CustomDropdown(
              labelText: 'Постачальник',
              items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
              onChanged: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 235, 208),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Додати позицію номенклатури',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
