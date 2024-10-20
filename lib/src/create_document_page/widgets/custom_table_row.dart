import 'package:flutter/material.dart';

class TableRowWidget extends TableRow {
  TableRowWidget({
    required String title,
    required String value,
    required Color color,
  }) : super(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 18, color: color),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                value,
                style: TextStyle(fontSize: 18, color: color),
              ),
            ),
          ],
        );
}
