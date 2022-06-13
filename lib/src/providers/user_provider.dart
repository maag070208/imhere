import 'dart:convert';
import 'package:get/get.dart';
import 'package:imhere/src/models/binding/user.dart';
import 'package:imhere/src/models/dto/user.dart';

import 'package:imhere/src/models/tResult.dart';
import '../enviroment/enviroment.dart';
import 'package:http/http.dart' as http;


class UserProvider extends GetConnect {
  String url = Environment.API_URL;

  Future<TResult> register(User newUser) async {

    final response =  await http.post(
        Uri.parse('$url/users'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(newUser.toJson())
    );
    print(response);
    if (response.body == null) {
      Get.snackbar('Error', 'No se pudo ejecutar la peticion');
      return TResult();
    }
    TResult responseApi = TResult.fromJson(jsonDecode(response.body));
    UserDto user = UserDto.fromJson(responseApi.result);
    print(user.toJson());
    return responseApi;
  }
}