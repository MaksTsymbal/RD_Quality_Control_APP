import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:check_point/src/main_page/data/inherited_widget.dart';
import 'package:check_point/src/user_info/ui/user_info_page.dart';
import 'package:check_point/src/create_document_page/ui/create_document_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.name});

  final String name;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<InfoModel> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response =
        await rootBundle.loadString('lib/src/main_page/data/test_info.json');
    final List<dynamic> dataList = json.decode(response);
    setState(() {
      _data = dataList
          .map((item) => InfoModel.fromJson(item as Map<String, dynamic>))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: Row(
          children: [
            const Spacer(flex: 4),
            Text(
              'Вітаю, ${widget.name}',
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Futura',
                fontSize: 30,
              ),
            ),
            const Spacer(flex: 2),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyInheritedWidget(
                      name: widget.name,
                      data: _data,
                      child: const UserPage(),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.person_outline,
                size: 35,
              ),
              color: Colors.black,
            ),
            const SizedBox(width: 2),
          ],
        ),
      ),
      body: Stack(
        children: [
          _data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(
                              bottom: 0.0, left: 0.0, right: 0.0),
                          child: DataTable(
                            columnSpacing: 31,
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
                            rows: _data.map((item) {
                              return DataRow(
                                color: item.status != true
                                    ? WidgetStateProperty.all(
                                        Colors.transparent)
                                    : WidgetStateProperty.all(Colors.orange),
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
                        ),
                      ],
                    ),
                  ),
                ),
          Positioned(
            bottom: 20,
            left: 50,
            right: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MyInheritedWidget(
                            name: widget.name,
                            data: _data,
                            child: const CreateQualityControllResultPage(),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.orange,
                      disabledBackgroundColor: Colors.orange,
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
                const SizedBox(height: 2),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    text: 'Версія: 1.0.1',
                    style: TextStyle(color: Colors.black, fontFamily: 'Futura'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
