import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';

class TableSection extends StatelessWidget {
  const TableSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext innerContext) {
        final inheritedWidget = MyInheritedWidget.of(innerContext);
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Table(
            border: TableBorder.all(color: Colors.black, width: 1),
            columnWidths: const {
              0: FlexColumnWidth(1),
              1: FlexColumnWidth(2),
            },
            children: [
              _buildTableRow('Автор:', inheritedWidget.name),
              _buildTableRow('Склад надходження:',
                  inheritedWidget.selectedWarehouse ?? 'Нічого не вибрано'),
              _buildTableRow('Дата надходження товару:',
                  inheritedWidget.selectedDate ?? 'Нічого не вибрано'),
              _buildTableRow('Постачальник:',
                  inheritedWidget.selectedSupplier ?? 'Нічого не вибрано'),
              _buildTableRow('Стан транспортного засобу:',
                  inheritedWidget.selectedVehicleCondition ?? 'Нічого не вибрано'),
              _buildTableRow('Постачальник схвалений:',
                  inheritedWidget.isSupplierApprovedSelected ? 'Так' : 'Ні'),
              _buildTableRow('Температура виміряна:',
                  inheritedWidget.isTemperatureMeasuredSelected ? 'Так' : 'Ні'),
            ],
          ),
        );
      },
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
