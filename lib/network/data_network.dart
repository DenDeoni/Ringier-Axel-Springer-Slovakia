import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';
import 'package:ringier_axel_springer_test/utils/constants.dart';

class DataNetwork {
  final RetryClient _client = RetryClient(http.Client());

  Future<Map<String, dynamic>> getDataFromNetwork(url) async {
    try {
      Response response = await _client.get(Uri.parse(url));
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      _client.close();
      return data;
    } catch (e) {
      if (kDebugMode) {
        print('ERROR DATA NETWORK: $e');
      }
      _client.close();
      return {DATA_LOADING_FAIL: true};
    } finally {
      _client.close();
    }
  }
}
