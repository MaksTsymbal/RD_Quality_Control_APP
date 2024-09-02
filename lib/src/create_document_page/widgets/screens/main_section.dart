import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_dropdown.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CustomDropdown(
            labelText: 'Склад надходження',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: provider.warehouse,
            onChanged: (value) => provider.warehouse = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Дата надходження товару',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: provider.date,
            onChanged: (value) => provider.date = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: 'Постачальник',
            items: const ['Позиція 1', 'Позиція 2', 'Позиція 3'],
            value: provider.supplier,
            onChanged: (value) => provider.supplier = value,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                      value: provider.supplierApproval,
                      onChanged: (value) => provider.supplierApproval = value,
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
                      value: provider.temperatureMeasured,
                      onChanged: (value) =>
                          provider.temperatureMeasured = value,
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
            value: provider.vehicleCondition,
            onChanged: (value) => provider.vehicleCondition = value,
          ),
        ],
      ),
    );
  }
}
