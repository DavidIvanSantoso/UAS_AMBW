import 'dart:convert';
import 'package:c14190040_01/dataclass.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<Welcome> getAllData() async {
    final response = await http.get(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'));
    if (response.statusCode == 200) {
      Welcome jsonResponse = Welcome.fromJson(json.decode(response.body));
      return jsonResponse;
    } else {
      throw Exception("Failed to load");
    }
  }
}
