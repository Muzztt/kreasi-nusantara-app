import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kreasi_nusantara/env.dart';
import 'package:kreasi_nusantara/models/forgot_password/forgot_password.dart';
import 'package:kreasi_nusantara/service/logging/logging.dart';
import 'package:kreasi_nusantara/shared/util/db_service/db_service.dart';
import 'package:kreasi_nusantara/shared/util/dio_interceptors/dio_interceptors.dart';

String? get currentUsername => DBService.get("username");
String? get currentEmail => DBService.get("email");
String? get token => DBService.get("token");

class AuthService {
  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await dio.post(
        "login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "email": email,
          "password": password,
        },
      );

      DBService.set("username", response.data["data"]["username"]);
      DBService.set("email", response.data["data"]["email"]);
      DBService.set("token", response.data["data"]["token"]);

      return response.data;
    } catch (err) {
      throw Exception('Failed to login: $err');
    }
  }

  Future<ForgotPassword> forgotPassword(String email) async {
    try {
      final response = await dio.post(
        "forgot-password",
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        return ForgotPassword.fromJson(response.data);
      } else {
        throw Exception('Failed to send forgot password request');
      }
    } catch (e) {
      throw Exception('Failed to send forgot password request: $e');
    }
  }

  Future<bool> verifyOtp({required String email, required String otp}) async {
    try {
      final response = await dio.post(
        "verify-otp",
        data: {
          'email': email,
          'otp': otp,
        },
      );

      print('Request: ${response.requestOptions.data}');
      print('Response: ${response.data}');

      if (response.statusCode == 200) {
        return response.data['status'] == 'success';
      } else {
        throw Exception('Failed to verify OTP');
      }
    } catch (e) {
      if (e is DioException) {
        print('DioException: ${e.response?.data}');
        print('Status code: ${e.response?.statusCode}');
      }
      throw Exception('Failed to verify OTP: $e');
    }
  }

  Future resetPassword(String email) async {
    try {
      await dio.post(
        "reset-password",
        data: {
          'email': email,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future register({
    required String firstName,
    required String lastName,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      await dio.post(
        "register",
        data: json.encode({
          'first_name': firstName,
          'last_name': lastName,
          'username': username,
          'email': email,
          'password': password,
        }),
      );
    } catch (e) {
      throw Exception('$e');
    }
  }

  Future logout() async {
    try {
      DBService.clear("username");
      DBService.clear("email");
      DBService.clear("token");
    } on Exception catch (e) {
      throw Exception('$e');
    }
  }
}
