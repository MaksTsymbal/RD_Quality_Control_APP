import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:check_point/src/create_document_page/widgets/custom_dropdown.dart';
import 'package:check_point/providers/quality_control_document_riverpod_provider.dart';

class MainSection extends ConsumerWidget {
  /// use riverpod for state management
  const MainSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedWarehouse = ref.watch(warehouseProvider);
    final selectedDate = ref.watch(dateProvider);
    final selectedSupplier = ref.watch(supplierProvider);
    final isSupplierApproved = ref.watch(supplierApprovalProvider);
    final isTemperatureMeasured = ref.watch(temperatureMeasuredProvider);
    final selectedVehicleCondition = ref.watch(vehicleConditionProvider);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CustomDropdown(
            labelText: 'Склад надходження',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: selectedWarehouse,
            onChanged: (value) =>
                ref.read(warehouseProvider.notifier).state = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Дата надходження товару',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: selectedDate,
            onChanged: (value) => ref.read(dateProvider.notifier).state = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Постачальник',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: selectedSupplier,
            onChanged: (value) =>
                ref.read(supplierProvider.notifier).state = value,
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
                      value: isSupplierApproved,
                      onChanged: (value) => ref
                          .read(supplierApprovalProvider.notifier)
                          .state = value,
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
                      value: isTemperatureMeasured,
                      onChanged: (value) => ref
                          .read(temperatureMeasuredProvider.notifier)
                          .state = value,
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
            value: selectedVehicleCondition,
            onChanged: (value) =>
                ref.read(vehicleConditionProvider.notifier).state = value,
          ),
        ],
      ),
    );
  }
}
