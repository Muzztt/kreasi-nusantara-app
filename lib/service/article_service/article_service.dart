import 'package:dio/dio.dart';
import 'package:kreasi_nusantara/env.dart';

class ArticleService {
  Future<List<Map<String, dynamic>>> get() async {
    final Dio dio = Dio();
    const String url = '$baseUrl/api/v1/articles';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $tokenUser',
          },
        ),
      );

      return List<Map<String, dynamic>>.from(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getById(String id) async {
    final Dio dio = Dio();
    final String url = '$baseUrl/api/v1/articles/$id';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $tokenUser',
          },
        ),
      );

      return Map<String, dynamic>.from(response.data['data']);
    } catch (e) {
      rethrow;
    }
  }
}
