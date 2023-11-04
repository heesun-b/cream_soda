import 'dart:convert';

import 'package:cream_soda/constants/http_setting/use_http.dart';
import 'package:http/http.dart';

class UserRepository {
  var baseUrl = UseHttp.baseUrl;
  var headers = UseHttp.getJsonTypeAcceptHeader();
  var basePort = UseHttp.basePort;
  final scheme = 'http';

  Future<Response> sendEmail({required String email}) async{
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: 'send/email', // 경로
    ).toString();

    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'email': email}));
  }

  Future<Response> sendCode({required String email, required String code}) async{
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: 'send/check', // 경로
    ).toString();

    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'email': email, 'check': code, 'time' : DateTime.now()}));
  }

  Future<Response> join(
      {required String email, required String password}) async {
    String encodedUrl = Uri(
      scheme: scheme,
      host: baseUrl,
      port: basePort,
      path: '/user/join', // 경로
    ).toString();
    return await post(Uri.parse(encodedUrl),
        headers: headers,
        body: jsonEncode({'email': email, 'password': password}));
  }
}
