import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';
import 'package:check_point/src/create_document_page/widgets/custom_switcher.dart';
import 'package:check_point/src/create_document_page/widgets/screens/main_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/table_section.dart';

class CreateQualityControllResultPage extends StatefulWidget {
  const CreateQualityControllResultPage({super.key});

  @override
  State<CreateQualityControllResultPage> createState() =>
      _CreateQualityControllResultPageState();
}

class _CreateQualityControllResultPageState
    extends State<CreateQualityControllResultPage> {
  int currentIndex = 0;

  String? selectedWarehouse;
  String? selectedDate;
  String? selectedSupplier;
  bool isSupplierApprovedSelected = false;
  bool isTemperatureMeasuredSelected = false;
  String? selectedVehicleCondition;

  @override
  Widget build(BuildContext context) {
    final info = MyInheritedWidget.of(context);
    return MyInheritedWidget(
      name: info.name,
      data: info.data,
      selectedWarehouse: selectedWarehouse,
      selectedDate: selectedDate,
      selectedSupplier: selectedSupplier,
      isSupplierApprovedSelected: isSupplierApprovedSelected,
      isTemperatureMeasuredSelected: isTemperatureMeasuredSelected,
      selectedVehicleCondition: selectedVehicleCondition,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 235, 208),
          title: const Text('Результат контролю якості 0001'),
        ),
        body: Column(
          children: [
            CustomSwitch(
              labels: const ["Основне", "Таблиця", "Безпека", "Якість"],
              onChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
            Expanded(
              child: IndexedStack(
                index: currentIndex,
                children: [
                  MainSection(
                    onWarehouseChanged: (value) {
                      setState(() {
                        selectedWarehouse = value;
                      });
                    },
                    onDateChanged: (value) {
                      setState(() {
                        selectedDate = value;
                      });
                    },
                    onSupplierChanged: (value) {
                      setState(() {
                        selectedSupplier = value;
                      });
                    },
                    onVehicleConditionChanged: (value) {
                      setState(() {
                        selectedVehicleCondition = value;
                      });
                    },
                    onSupplierApprovalChanged: (value) {
                      setState(() {
                        isSupplierApprovedSelected = value;
                      });
                    },
                    onTemperatureMeasuredChanged: (value) {
                      setState(() {
                        isTemperatureMeasuredSelected = value;
                      });
                    },
                  ),
                  TableSection(),
                ],
              ),
            ),
          ],
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
      ),
    );
  }
}
