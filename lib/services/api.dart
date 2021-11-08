import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Callapi {
  final String _url = "https://masjidku.my/api/";

  postLogin(data) {
    Uri fullUrl = Uri.parse(_url + 'apilogin');
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }

  getData(url) async {
    Uri fullUrl = Uri.parse(_url + url);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');

    return http.get(fullUrl, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }
}
