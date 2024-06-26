import 'package:dio/dio.dart';
import 'package:kreasi_nusantara/env.dart';
import 'package:kreasi_nusantara/shared/util/dio_interceptors/dio_interceptors.dart';

class BaseService<T> {
  String endpoint = "";

  Future<T> get() async {
    var url = "$baseUrl/$endpoint";

    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return decode(response.data);
  }

  Future<T> getById(dynamic id) async {
    var url = "$baseUrl/$endpoint/$id";

    var response = await dio.get(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return decode(response.data);
  }

  T decode(data) {
    dynamic model;
    return model.fromJson(data);
  }

  Future create(Map data) async {
    var url = "$baseUrl/$endpoint";

    var response = await dio.post(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: data,
    );
    return response.data;
  }

  Future update(dynamic id, Map data) async {
    var url = "$baseUrl$endpoint/$id";

    var response = await dio.put(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
      data: data,
    );
    return response.data;
  }

  Future delete(dynamic id) async {
    var url = "$baseUrl/$endpoint/$id";

    var response = await dio.delete(
      url,
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    return response.data;
  }
}
