import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:check_point/src/create_document_page/widgets/custom_switcher.dart';
import 'package:check_point/src/create_document_page/widgets/screens/main_section.dart';
import 'package:check_point/src/create_document_page/widgets/screens/table_section.dart';
import 'package:check_point/providers/quality_control_document_riverpod_provider.dart';

class CreateQualityControllResultPage extends ConsumerWidget {
  /// use riverpod for state management
  final String name;
  final List<dynamic> data;

  const CreateQualityControllResultPage({
    super.key,
    required this.name,
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.microtask(() {
      ref.read(nameProvider.notifier).state = name;
      ref.read(dataProvider.notifier).state = data;
    });

    final currentIndex = ref.watch(_currentIndexProvider);

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
              ref.read(_currentIndexProvider.notifier).state = index;
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

final _currentIndexProvider = StateProvider<int>((ref) => 0);
