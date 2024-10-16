import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/main_page/data/async_documents_loader.dart';
import 'package:go_router/go_router.dart';
import 'package:check_point/providers/documents_provider.dart';
import 'package:check_point/common/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainPage extends StatefulWidget {
  /// use provider for state management
  const MainPage({super.key, required this.name});

  final String name;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DocumentsModel _documentsModel = DocumentsModel();
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final documents = await _documentsModel.fetchDocuments();

    //work with provider
    Provider.of<DocumentsProvider>(context, listen: false)
        .setDocuments(documents);
  }

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.themeOf(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmallScreen = constraints.maxWidth < 600;
            return Column(
              children: [
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        backgroundColor: theme.scaffoldBackgroundColor,
                        floating: true,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                              '${AppLocalizations.of(context)!.hello} ${widget.name}',
                              style: theme.textTheme.headlineMedium),
                        ),
                        actions: [
                          IconButton(
                            onPressed: () {
                              context.pushNamed('user_page');
                            },
                            icon: const Icon(
                              Icons.person_outline,
                              size: 35,
                            ),
                            color: theme.colorScheme.primary,
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: FutureBuilder<List<InfoModel>>(
                          future: _documentsModel.fetchAndConvertDocuments(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty) {
                              final List<InfoModel> documents = snapshot.data!;

                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: DataTable(
                                  columnSpacing: isSmallScreen ? 20 : 31,
                                  dividerThickness: 2,
                                  border: TableBorder.all(
                                    color: theme.colorScheme.primary,
                                    width: 1,
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: Center(
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .data,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                    ),
                                    DataColumn(
                                      label: Center(
                                          child: Text(
                                              AppLocalizations.of(context)!.fop,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                    ),
                                  ],
                                  rows: documents.map((item) {
                                    return DataRow(
                                      color: item.status != true
                                          ? WidgetStateProperty.all(
                                              Colors.transparent)
                                          : WidgetStateProperty.all(
                                              theme.cardColor),
                                      cells: [
                                        DataCell(Center(
                                            child: Text(item.date,
                                                style: theme
                                                    .textTheme.bodyMedium))),
                                        DataCell(Center(
                                            child: Text(item.fop,
                                                style: theme
                                                    .textTheme.bodySmall))),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              );
                            } else {
                              // Якщо немає документів у базі, використовуємо дані з провайдера
                              return Consumer<DocumentsProvider>(
                                builder: (context, documentsProvider, child) {
                                  final documents = documentsProvider.documents;
                                  return documents.isEmpty
                                      ? const Center(
                                          child: CircularProgressIndicator())
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: DataTable(
                                            columnSpacing:
                                                isSmallScreen ? 20 : 31,
                                            dividerThickness: 2,
                                            border: TableBorder.all(
                                              color: theme.colorScheme.primary,
                                              width: 1,
                                            ),
                                            columns: [
                                              DataColumn(
                                                label: Center(
                                                    child: Text(
                                                        AppLocalizations.of(
                                                                context)!
                                                            .data,
                                                        style: theme.textTheme
                                                            .bodyLarge)),
                                              ),
                                              DataColumn(
                                                  label: Center(
                                                      child: Text(
                                                          AppLocalizations.of(
                                                                  context)!
                                                              .fop,
                                                          style: theme.textTheme
                                                              .bodyLarge))),
                                            ],
                                            rows: documents.map((item) {
                                              return DataRow(
                                                color: item.status != true
                                                    ? WidgetStateProperty.all(
                                                        Colors.transparent)
                                                    : WidgetStateProperty.all(
                                                        theme.cardColor),
                                                cells: [
                                                  DataCell(Center(
                                                      child: Text(item.date,
                                                          style: theme.textTheme
                                                              .bodyMedium))),
                                                  DataCell(Center(
                                                      child: Text(item.fop,
                                                          style: theme.textTheme
                                                              .bodySmall))),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        );
                                },
                              );
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 50.0, right: 50.0, top: 10),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            context.pushNamed(
                              'create_document',
                              extra: {
                                'name': widget.name,
                                'data':
                                    context.read<DocumentsProvider>().documents,
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 15.0),
                          ),
                          child: Text(
                            AppLocalizations.of(context)!.createDocument,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        AppLocalizations.of(context)!.versionInfo('1.0.0'),
                        style: theme.textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
