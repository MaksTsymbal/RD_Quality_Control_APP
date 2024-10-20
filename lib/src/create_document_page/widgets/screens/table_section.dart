import 'package:check_point/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_table_row.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TableSection extends StatelessWidget {
  const TableSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);
    final theme = AppTheme.themeOf(context);

    final name = provider.name;
    final selectedWarehouse =
        provider.warehouse ?? AppLocalizations.of(context)!.nothing_picked;
    final selectedDate =
        provider.date ?? AppLocalizations.of(context)!.nothing_picked;
    final selectedSupplier =
        provider.supplier ?? AppLocalizations.of(context)!.nothing_picked;
    final isSupplierApproved = provider.supplierApproval
        ? AppLocalizations.of(context)!.yes
        : AppLocalizations.of(context)!.no;
    final isTemperatureMeasured = provider.temperatureMeasured
        ? AppLocalizations.of(context)!.yes
        : AppLocalizations.of(context)!.no;
    final selectedVehicleCondition = provider.vehicleCondition ??
        AppLocalizations.of(context)!.nothing_picked;

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Table(
        border: TableBorder.all(color: theme.colorScheme.primary, width: 1),
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(2),
        },
        children: [
          TableRowWidget(
              title: AppLocalizations.of(context)!.author,
              value: name,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.warehouse,
              value: selectedWarehouse,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.date,
              value: selectedDate,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.transporter,
              value: selectedSupplier,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.auto_quality,
              value: selectedVehicleCondition,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.transporter_good,
              value: isSupplierApproved,
              color: theme.colorScheme.primary),
          TableRowWidget(
              title: AppLocalizations.of(context)!.temperature,
              value: isTemperatureMeasured,
              color: theme.colorScheme.primary),
        ],
      ),
    );
  }
}
