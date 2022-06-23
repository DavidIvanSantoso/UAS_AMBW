import 'dart:convert';
import 'package:c14190040_01/dataclass.dart';
import 'package:http/http.dart' as http;

class Service {
  Future<List<cData>> getAllData() async {
    final response = await http.get(
        Uri.parse('https://api-berita-indonesia.vercel.app/cnbc/terbaru/'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => cData.fromJson(data)).toList();
    } else {
      throw Exception("Failed to load");
    }
  }
}
