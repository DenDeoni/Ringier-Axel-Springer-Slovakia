import 'package:flutter/foundation.dart';

import 'constants.dart';

String baseURL() {
  String url = const String.fromEnvironment('BASE_URL');
  return url;
}
