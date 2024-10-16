import 'dart:convert';
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

    return documents;
  }

  // Future Implementation
  // Future<List<InfoModel>> fetchDocumentsFromApi() async {
  //   final documents = await DocumentsImplementation().fetchDocumentsFromApi();
  //   return documents.map((item) => InfoModel.fromJson(item)).toList();
  // }
}
