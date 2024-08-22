import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';
import 'package:check_point/src/create_document_page/widgets/custom_dropdown.dart';

class MainSection extends StatelessWidget {
  final ValueChanged<String?> onWarehouseChanged;
  final ValueChanged<String?> onDateChanged;
  final ValueChanged<String?> onSupplierChanged;
  final ValueChanged<String?> onVehicleConditionChanged;
  final ValueChanged<bool> onSupplierApprovalChanged;
  final ValueChanged<bool> onTemperatureMeasuredChanged;

  const MainSection({
    super.key,
    required this.onWarehouseChanged,
    required this.onDateChanged,
    required this.onSupplierChanged,
    required this.onVehicleConditionChanged,
    required this.onSupplierApprovalChanged,
    required this.onTemperatureMeasuredChanged,
  });

  @override
  Widget build(BuildContext context) {
    final inheritedWidget = MyInheritedWidget.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CustomDropdown(
            labelText: 'Склад надходження',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: inheritedWidget.selectedWarehouse,
            onChanged: onWarehouseChanged,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Дата надходження товару',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: inheritedWidget.selectedDate,
            onChanged: onDateChanged,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Постачальник',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: inheritedWidget.selectedSupplier,
            onChanged: onSupplierChanged,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Постачальник схвалений',
                        style: TextStyle(fontSize: 16)),
                    Switch(
                      activeTrackColor: Colors.orange,
                      value: inheritedWidget.isSupplierApprovedSelected,
                      onChanged: onSupplierApprovalChanged,
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Температура виміряна',
                        style: TextStyle(fontSize: 16)),
                    Switch(
                      activeTrackColor: Colors.orange,
                      value: inheritedWidget.isTemperatureMeasuredSelected,
                      onChanged: onTemperatureMeasuredChanged,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          CustomDropdown(
            labelText: 'Стан транспортного засобу',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: inheritedWidget.selectedVehicleCondition,
            onChanged: onVehicleConditionChanged,
          ),
        ],
      ),
    );
  }
}
