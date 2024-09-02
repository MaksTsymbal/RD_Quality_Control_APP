import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_table_row.dart';

class TableSection extends StatelessWidget {
  const TableSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);

    final name = provider.name;
    final selectedWarehouse = provider.warehouse ?? 'Нічого не вибрано';
    final selectedDate = provider.date ?? 'Нічого не вибрано';
    final selectedSupplier = provider.supplier ?? 'Нічого не вибрано';
    final isSupplierApproved = provider.supplierApproval ? 'Так' : 'Ні';
    final isTemperatureMeasured = provider.temperatureMeasured ? 'Так' : 'Ні';
    final selectedVehicleCondition =
        provider.vehicleCondition ?? 'Нічого не вибрано';

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Table(
        border: TableBorder.all(color: Colors.black, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: [
          TableRowWidget(title: 'Автор:', value: name),
          TableRowWidget(title: 'Склад надходження:', value: selectedWarehouse),
          TableRowWidget(
              title: 'Дата надходження товару:', value: selectedDate),
          TableRowWidget(title: 'Постачальник:', value: selectedSupplier),
          TableRowWidget(
              title: 'Стан транспортного засобу:',
              value: selectedVehicleCondition),
          TableRowWidget(
              title: 'Постачальник схвалений:', value: isSupplierApproved),
          TableRowWidget(
              title: 'Температура виміряна:', value: isTemperatureMeasured),
        ],
      ),
    );
  }
}
