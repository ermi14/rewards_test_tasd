import 'package:http/http.dart' as http;
import 'package:task_rewards/utils/string_constants.dart';

class ApiHelper {
  static const String baseUrl = kBaseUrl;

  static Future<http.Response> getRequest(String endpoint) async {
    final Uri uri = Uri.parse('$baseUrl$endpoint');

    try {
      final response = await http.get(uri);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}