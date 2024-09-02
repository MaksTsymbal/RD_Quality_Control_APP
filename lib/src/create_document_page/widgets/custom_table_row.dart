import 'package:flutter/material.dart';

class TableRowWidget extends TableRow {
  TableRowWidget({
    required String title,
    required String value,
  }) : super(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: const TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
          ],
        );
}
