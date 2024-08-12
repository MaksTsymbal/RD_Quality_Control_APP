import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.name});

  final String name;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Map<String, dynamic>> _data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final String response = await rootBundle.loadString('lib/src/mainPage/data/test_info.json');
    final List<dynamic> dataList = json.decode(response);
    setState(() {
      _data = dataList.map((item) {
        return {
          "date": item['date'],
          "FOP": item['FOP'],
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: Text('Вітаю, ${widget.name}', style: const TextStyle(color: Colors.black, fontFamily: 'Futura', fontSize: 30)),
      ),
      body: Stack(
        children: [
          _data.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Padding (
                  padding: const EdgeInsets.only(bottom: 120.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.only(bottom: 0.0, left: 0.0, right: 0.0),
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
                                cells: [
                                  DataCell(Center(
                                      child: Text(item['date'] as String,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontFamily: 'Futura',
                                              fontSize: 20)))),
                                  DataCell(Center(
                                      child: Text(item['FOP'] as String,
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
                    onPressed: null,
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
                    text: 'Версія: 1.0.0',
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