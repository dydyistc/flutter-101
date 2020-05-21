

import 'package:flutter101/http/http/http_manager.dart';

class Global {
  static Future init() async {
    await HttpManager.init();
  }
}