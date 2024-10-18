import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:check_point/src/constants.dart';

class DocumentsImplementation {
  Future<List<Map<String, dynamic>>> fetchDocumentsFromApi() async {
    final url = Uri.parse('${ApiConstants.baseUrl}/documents');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => item as Map<String, dynamic>).toList();
    } else {
      throw Exception('Failed to load documents');
    }
  }
}
