import 'package:check_point/src/main_page/data/info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:check_point/src/create_document_page/widgets/custom_switcher.dart';
import 'package:check_point/src/create_document_page/widgets/screens/main_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/table_section.dart';
import 'package:check_point/providers/quality_control_document_provider.dart';

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
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 235, 208),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 235, 208),
        title: const Text('Результат контролю якості 0001'),
      ),
      body: Column(
        children: [
          CustomSwitch(
            labels: const ["Основне", "Таблиця", "Безпека", "Якість"],
            onChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          Expanded(
            child: IndexedStack(
              index: currentIndex,
              children: const [
                MainSection(),
                TableSection(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 255, 235, 208),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Додати позицію номенклатури',
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
