// lib/core/api/api_client.dart
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// part 'api_client.g.dart';

@riverpod
Dio apiClient(Ref ref) {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3/',
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 10),
  ));

  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) async {
      // Ví dụ: Tự động thêm API key hoặc token vào mỗi request
      // final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      // options.headers['Authorization'] = 'Bearer $token';
      options.queryParameters['api_key'] = 'YOUR_API_KEY'; // Thay bằng key của bạn
      return handler.next(options);
    },
    onError: (e, handler) {
      // Xử lý các lỗi chung (401, 500...)
      return handler.next(e);
    },
  ));

  return dio;
}