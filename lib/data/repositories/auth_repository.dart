import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRepository {
  final url = Uri.parse('http://172.16.11.19:8080/EMS1/api/login');
  Future<Map<String, dynamic>> login(
      {required String username, required String password}) async {
    final response = await http.post(url, body: {
      'email': username,
      'password': password,
    });
    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        print('401');

        throw const HttpException('Bad Credentials');
      } else if (response.statusCode == 404) {
        print('404');
        throw const HttpException('Server Connection Error');
      } else {
        print(response.statusCode);
        throw Exception('Unkown Error');
      }
    }
    return {
      'user': json.decode(response.body)['user'],
      'token': json.decode(response.body)['token'],
    };
  }
}
