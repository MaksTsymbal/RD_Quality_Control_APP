import 'package:flutter/material.dart';
import 'package:check_point/src/createDocumentPage/widgets/custom_switcher.dart';
import 'package:check_point/src/createDocumentPage/widgets/custom_dropdown.dart';

class CreateQualityControllResultPage extends StatefulWidget {
  const CreateQualityControllResultPage({super.key});

  @override
  State<CreateQualityControllResultPage> createState() =>
      _CreateQualityControllResultPageState();
}

class _CreateQualityControllResultPageState
    extends State<CreateQualityControllResultPage> {
  bool isSupplierApprovedSelected = false;
  bool isTemperatureMeasuredSelected = false;

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
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 26.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Постачальник схвалений',
                          style: TextStyle(fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSupplierApprovedSelected = !isSupplierApprovedSelected;
                          });
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSupplierApprovedSelected ? Colors.red : Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: isSupplierApprovedSelected
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Температуру виміряно',
                          style: TextStyle(fontSize: 16)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isTemperatureMeasuredSelected = !isTemperatureMeasuredSelected;
                          });
                        },
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.transparent,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isTemperatureMeasuredSelected
                                    ? Colors.red
                                    : Colors.black,
                                width: 2,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: CircleAvatar(
                                radius: 8,
                                backgroundColor: isTemperatureMeasuredSelected
                                    ? Colors.red
                                    : Colors.transparent,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            CustomDropdown(
              labelText: 'Стан транспортного засобу',
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
