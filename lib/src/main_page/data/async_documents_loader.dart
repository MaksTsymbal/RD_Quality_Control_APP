import 'dart:convert';
import 'package:check_point/database/database_helper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:check_point/src/main_page/data/info_model.dart';

class DocumentsModel {
  Future<List<InfoModel>> fetchDocuments() async {

    final String response =
        await rootBundle.loadString('lib/src/main_page/data/test_info.json');

    final List<Map<String, Object?>> dataList = (json.decode(response) as List)
        .map((item) => item as Map<String, Object?>)
        .toList();

    List<InfoModel> documents =
        dataList.map((item) => InfoModel.fromJson(item)).toList();

    if (!kIsWeb) {
      final db = await DatabaseHelper.instance.database;
      //work with database
      for (var document in documents) {
        await db.insert('documents', {
          'FOP': document.fop,
          'date': document.date,
          'status': document.status ? 1 : 0,
        });
      }
    }

    return documents;
  }

  Future<List<InfoModel>> fetchAndConvertDocuments() async {
    if (kIsWeb) {
      final String response =
          await rootBundle.loadString('lib/src/main_page/data/test_info.json');

      final List<Map<String, Object?>> dataList =
          (json.decode(response) as List)
              .map((item) => item as Map<String, Object?>)
              .toList();

      List<InfoModel> documents =
          dataList.map((item) => InfoModel.fromJson(item)).toList();
      return documents;
    } else {
      final List<Map<String, Object?>> dbDocuments =
          await DatabaseHelper.instance.fetchDocuments();

      // Явна типізація без використання dynamic
      return dbDocuments.map((doc) {
        return InfoModel(
          fop: doc['FOP'] as String,
          date: doc['date'] as String,
          status: (doc['status'] as int) == 1,
        );
      }).toList();
    }
  }

  // Future Implementation
  // Future<List<InfoModel>> fetchDocumentsFromApi() async {
  //   final documents = await DocumentsImplementation().fetchDocumentsFromApi();
  //   return documents.map((item) => InfoModel.fromJson(item)).toList();
  // }
}
