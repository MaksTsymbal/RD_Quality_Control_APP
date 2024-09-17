import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:go_router/go_router.dart';
import 'package:check_point/providers/documents_provider.dart';

class MainPage extends StatefulWidget {
  /// use provider for state management
  const MainPage({super.key, required this.name});

  final String name;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('lib/src/main_page/data/test_info.json');

    final List<Map<String, Object?>> dataList = (json.decode(response) as List)
        .map((item) => item as Map<String, Object?>)
        .toList();

    List<InfoModel> documents =
        dataList.map((item) => InfoModel.fromJson(item)).toList();

    Provider.of<DocumentsProvider>(context, listen: false)
        .setDocuments(documents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
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
                        backgroundColor:
                            const Color.fromARGB(255, 255, 235, 208),
                        floating: true,
                        pinned: false,
                        flexibleSpace: FlexibleSpaceBar(
                          title: Text(
                            'Вітаю, ${widget.name}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Futura',
                              fontSize: 30,
                            ),
                          ),
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
                            color: Colors.black,
                          ),
                        ],
                      ),
                      SliverToBoxAdapter(
                        child: Consumer<DocumentsProvider>(
                          builder: (context, documentsProvider, child) {
                            final documents = documentsProvider.documents;
                            return documents.isEmpty
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20.0),
                                    child: DataTable(
                                      columnSpacing: isSmallScreen ? 20 : 31,
                                      dividerThickness: 2,
                                      border: TableBorder.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      columns: const [
                                        DataColumn(
                                            label: Center(
                                                child: Text('Дата',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Futura',
                                                        fontSize: 24)))),
                                        DataColumn(
                                            label: Center(
                                                child: Text('ФОП',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Futura',
                                                        fontSize: 24)))),
                                      ],
                                      rows: documents.map((item) {
                                        return DataRow(
                                          color: item.status != true
                                              ? WidgetStateProperty.all(
                                                  Colors.transparent)
                                              : WidgetStateProperty.all(
                                                  Colors.orange),
                                          cells: [
                                            DataCell(Center(
                                                child: Text(item.date,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Futura',
                                                        fontSize: 20)))),
                                            DataCell(Center(
                                                child: Text(item.fop,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontFamily: 'Futura',
                                                        fontSize: 18)))),
                                          ],
                                        );
                                      }).toList(),
                                    ),
                                  );
                          },
                        ),
                      ),
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
                          child: const Text(
                            'Створити',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Версія: 1.0.1',
                        style: TextStyle(
                            color: Colors.black, fontFamily: 'Futura'),
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
