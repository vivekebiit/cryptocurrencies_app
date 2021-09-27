import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Network {
  final String url;

  Network(this.url);

  Future postWebService(Map<String, dynamic> work) async {
    debugPrint('URL: $url');
    debugPrint(jsonEncode(work));

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(work),
      headers: {
        'Content-type': 'application/json',
      },
    );

    debugPrint('HOS Response Code: ${response.statusCode}');
    debugPrint('HOS Response : ${response.body}');

    final errorResponse = {
      'sHasError': false,
      'title': 'Failed to establish connection to the server'
    };

    final sessionExpired = {'sHasError': true, 'title': 'Session expired'};

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      return sessionExpired;
    } else {
      return errorResponse;
    }
  }

  Future getWebService() async {
    debugPrint('URL: $url');
    String token = '';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-type': 'application/json',
        'X-CMC_PRO_API_KEY': '',
      },
    );

    debugPrint('HOS Response Code: ${response.statusCode}');
    debugPrint('HOS Response : ${response.body}');

    final errorResponse = {
      'sHasError': false,
      'title': 'Failed to establish connection to the server'
    };

    final sessionExpired = {'sHasError': true, 'title': 'Session expired'};
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      return sessionExpired;
    } else {
      return errorResponse;
    }
  }
}
