import 'package:flutter/material.dart';
import 'package:check_point/src/main_page/data/info_model.dart';

class DocumentsProvider with ChangeNotifier {
  List<InfoModel> _documents = [];

  List<InfoModel> get documents => _documents;

  int get documentCount => _documents.length;

  void setDocuments(List<InfoModel> documents) {
    _documents = documents;
    notifyListeners();
  }

  void addDocument(InfoModel document) {
    _documents.add(document);
    notifyListeners();
  }

  void removeDocument(InfoModel document) {
    _documents.remove(document);
    notifyListeners();
  }

  void clearDocuments() {
    _documents.clear();
    notifyListeners();
  }
}
