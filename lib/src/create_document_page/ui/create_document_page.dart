import 'package:check_point/common/theme/theme.dart';
import 'package:check_point/src/create_document_page/widgets/screens/quality_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/security_section.dart';
import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_switcher.dart';
import 'package:check_point/src/create_document_page/widgets/screens/main_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/table_section.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final provider =
          Provider.of<QualityControlDocumentProvider>(context, listen: false);
      provider.name = widget.name;
      provider.data = widget.data;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeOf(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text(
          AppLocalizations.of(context)!.appbar_text,
          style: theme.textTheme.bodyMedium,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colorScheme.primary),
          onPressed: () {
            context.goNamed('main', pathParameters: {'name': widget.name});
          },
        ),
      ),
      body: Column(
        children: [
          CustomSwitch(
            labels: [
              AppLocalizations.of(context)!.main,
              AppLocalizations.of(context)!.table,
              AppLocalizations.of(context)!.security_doc,
              AppLocalizations.of(context)!.quality_doc
            ],
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Expanded(
            child: OrientationBuilder(
              builder: (context, orientation) {
                bool isLandscape = orientation == Orientation.landscape;
                return isLandscape
                    ? SingleChildScrollView(
                        child: IndexedStack(
                          index: currentIndex,
                          children: const [
                            MainSection(),
                            TableSection(),
                            PhotoSectionQuality(),
                            PhotoSectionSecurity(),
                          ],
                        ),
                      )
                    : IndexedStack(
                        index: currentIndex,
                        children: const [
                          MainSection(),
                          TableSection(),
                          PhotoSectionQuality(),
                          PhotoSectionSecurity(),
                        ],
                      );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: theme.scaffoldBackgroundColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
          ),
          onPressed: () {
            context.pop();
          },
          child: Text(
            AppLocalizations.of(context)!.add_position,
            style: const TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
