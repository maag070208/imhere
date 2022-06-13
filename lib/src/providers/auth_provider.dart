import 'dart:convert';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:imhere/src/models/tResult.dart';
import '../enviroment/enviroment.dart';
import 'package:http/http.dart' as http;

import '../models/auth.dart';

class AuthProvider extends GetConnect {
  String url = Environment.API_URL;
  Future<TResult> login(String email, String password) async {
    var data = {
      'Email':email,
      'Password':password,
    };
    final response =  await http.post(
        Uri.parse('$url/auth'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(data)
    );
    print(response);
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return TResult();
    }
    TResult responseApi = TResult.fromJson(jsonDecode(response.body));
    UserAuth user = UserAuth.fromJson(parseJwt(responseApi.result));
    print(user.toJson());
    GetStorage().write('user', user);
    GetStorage().write('token', responseApi.result);
    return responseApi;
  }
}
Map<String, dynamic> parseJwt(String token) {
  final parts = token.split('.');
  if (parts.length != 3) {
    throw Exception('invalid token');
  }

  final payload = _decodeBase64(parts[1]);
  final payloadMap = json.decode(payload);
  if (payloadMap is! Map<String, dynamic>) {
    throw Exception('invalid payload');
  }

  return payloadMap;
}
String _decodeBase64(String str) {
  String output = str.replaceAll('-', '+').replaceAll('_', '/');
  switch (output.length % 4) {
    case 0:
      break;
    case 2:
      output += '==';
      break;
    case 3:
      output += '=';
      break;
    default:
      throw Exception('Illegal base64url string!"');
  }

  return utf8.decode(base64Url.decode(output));
}