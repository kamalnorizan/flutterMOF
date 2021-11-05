import 'dart:convert';

import 'package:http/http.dart' as http;

class Callapi {
  final String _url = "https://masjidku.my/api/";

  postLogin(data) {
    Uri fullUrl = Uri.parse(_url + 'apilogin');
    return http.post(fullUrl, body: jsonEncode(data), headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    });
  }
}
