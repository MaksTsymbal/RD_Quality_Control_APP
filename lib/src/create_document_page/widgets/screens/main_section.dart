import 'package:check_point/common/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_dropdown.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainSection extends StatelessWidget {
  const MainSection({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<QualityControlDocumentProvider>(context);
    final theme = AppTheme.themeOf(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          CustomDropdown(
            labelText: AppLocalizations.of(context)!.warehouse,
            items: [
              AppLocalizations.of(context)!.position1,
              AppLocalizations.of(context)!.position2,
              AppLocalizations.of(context)!.position3
            ],
            style: theme.textTheme.bodySmall,
            value: provider.warehouse,
            onChanged: (value) => provider.warehouse = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: AppLocalizations.of(context)!.date,
            items: [
              AppLocalizations.of(context)!.position1,
              AppLocalizations.of(context)!.position2,
              AppLocalizations.of(context)!.position3
            ],
            style: theme.textTheme.bodySmall,
            value: provider.date,
            onChanged: (value) => provider.date = value,
          ),
          const SizedBox(height: 20),
          CustomDropdown(
            labelText: AppLocalizations.of(context)!.transporter,
            items: [
              AppLocalizations.of(context)!.position1,
              AppLocalizations.of(context)!.position2,
              AppLocalizations.of(context)!.position3
            ],
            style: theme.textTheme.bodySmall,
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
                    Text(AppLocalizations.of(context)!.transporter_good,
                        style: theme.textTheme.bodySmall),
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
                    Text(AppLocalizations.of(context)!.temperature,
                        style: theme.textTheme.bodySmall),
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
            labelText: AppLocalizations.of(context)!.auto_quality,
            items: [
              AppLocalizations.of(context)!.position1,
              AppLocalizations.of(context)!.position2,
              AppLocalizations.of(context)!.position3
            ],
            style: theme.textTheme.bodySmall,
            value: provider.vehicleCondition,
            onChanged: (value) => provider.vehicleCondition = value,
          ),
        ],
      ),
    );
  }
}
