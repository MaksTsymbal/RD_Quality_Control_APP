import 'package:flutter/material.dart';

class CreateQualityControllResultPage extends StatefulWidget {
  const CreateQualityControllResultPage({super.key});

  @override
  State<CreateQualityControllResultPage> createState() => _CreateQualityControllResultPageState();
}


class _CreateQualityControllResultPageState extends State<CreateQualityControllResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Quality Controll Result'),
      ),
      body: const Center(
        child: Text('Create Quality Controll Result'),
      ),
    );
  }
}