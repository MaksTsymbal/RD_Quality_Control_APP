import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';
import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:check_point/src/create_document_page/widgets/custom_switcher.dart';
import 'package:check_point/src/create_document_page/widgets/screens/main_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/table_section.dart';

class CreateQualityControllResultPage extends StatefulWidget {
  final String name;
  final List<InfoModel> data;

  const CreateQualityControllResultPage({
    super.key,
    required this.name,
    required this.data,
  });

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

  void updateState({
    String? selectedWarehouse,
    String? selectedDate,
    String? selectedSupplier,
    bool? isSupplierApprovedSelected,
    bool? isTemperatureMeasuredSelected,
    String? selectedVehicleCondition,
  }) {
    setState(() {
      if (selectedWarehouse != null) this.selectedWarehouse = selectedWarehouse;
      if (selectedDate != null) this.selectedDate = selectedDate;
      if (selectedSupplier != null) this.selectedSupplier = selectedSupplier;
      if (isSupplierApprovedSelected != null)
        this.isSupplierApprovedSelected = isSupplierApprovedSelected;
      if (isTemperatureMeasuredSelected != null)
        this.isTemperatureMeasuredSelected = isTemperatureMeasuredSelected;
      if (selectedVehicleCondition != null)
        this.selectedVehicleCondition = selectedVehicleCondition;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      name: widget.name,
      data: widget.data,
      selectedWarehouse: selectedWarehouse,
      selectedDate: selectedDate,
      selectedSupplier: selectedSupplier,
      isSupplierApprovedSelected: isSupplierApprovedSelected,
      isTemperatureMeasuredSelected: isTemperatureMeasuredSelected,
      selectedVehicleCondition: selectedVehicleCondition,
      updateState: updateState,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 235, 208),
          title: const Text('Результат контролю якості 0001'),
        ),
        body: Builder(
          builder: (BuildContext innerContext) {
            final inheritedData = MyInheritedWidget.maybeOf(innerContext);
            if (inheritedData == null) {
              return const Center(
                  child: Text('Помилка: MyInheritedWidget не знайдено'));
            }
            return Column(
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
                          inheritedData.updateState(selectedWarehouse: value);
                        },
                        onDateChanged: (value) {
                          inheritedData.updateState(selectedDate: value);
                        },
                        onSupplierChanged: (value) {
                          inheritedData.updateState(selectedSupplier: value);
                        },
                        onVehicleConditionChanged: (value) {
                          inheritedData.updateState(
                              selectedVehicleCondition: value);
                        },
                        onSupplierApprovalChanged: (value) {
                          inheritedData.updateState(
                              isSupplierApprovedSelected: value);
                        },
                        onTemperatureMeasuredChanged: (value) {
                          inheritedData.updateState(
                              isTemperatureMeasuredSelected: value);
                        },
                      ),
                      const TableSection(),
                    ],
                  ),
                ),
              ],
            );
          },
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
