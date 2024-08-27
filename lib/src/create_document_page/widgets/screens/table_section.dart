import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:check_point/providers/quality_control_document_riverpod_provider.dart';

class TableSection extends ConsumerWidget {
  /// use riverpod for state management
  const TableSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    final selectedWarehouse = ref.watch(warehouseProvider);
    final selectedDate = ref.watch(dateProvider);
    final selectedSupplier = ref.watch(supplierProvider);
    final isSupplierApproved = ref.watch(supplierApprovalProvider);
    final isTemperatureMeasured = ref.watch(temperatureMeasuredProvider);
    final selectedVehicleCondition = ref.watch(vehicleConditionProvider);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: [
          _buildTableRow('Автор:', name),
          _buildTableRow(
              'Склад надходження:', selectedWarehouse ?? 'Нічого не вибрано'),
          _buildTableRow(
              'Дата надходження товару:', selectedDate ?? 'Нічого не вибрано'),
          _buildTableRow(
              'Постачальник:', selectedSupplier ?? 'Нічого не вибрано'),
          _buildTableRow('Стан транспортного засобу:',
              selectedVehicleCondition ?? 'Нічого не вибрано'),
          _buildTableRow(
              'Постачальник схвалений:', isSupplierApproved ? 'Так' : 'Ні'),
          _buildTableRow(
              'Температура виміряна:', isTemperatureMeasured ? 'Так' : 'Ні'),
        ],
      ),
    );
  }

  TableRow _buildTableRow(String title, String value) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            value,
            style: const TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }
}
