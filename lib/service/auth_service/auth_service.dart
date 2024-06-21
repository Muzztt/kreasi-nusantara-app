import 'package:dio/dio.dart';
import 'package:kreasi_nusantara/env.dart';
import 'package:kreasi_nusantara/models/forgot_password/forgot_password.dart';
import 'package:kreasi_nusantara/service/logging/logging.dart';

class AuthService {
  final Dio _dio;

  AuthService() : _dio = Dio(BaseOptions(baseUrl: baseUrl)) {
    _dio.interceptors.add(Logging());
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        "/api/v1/login",
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
      return response.data;
    } catch (err) {
      throw Exception('Failed to login: $err');
    }
  }

  Future<ForgotPassword> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        "/api/v1/forgot-password",
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
      final response = await _dio.post(
        "/api/v1/verify-otp",
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
}
