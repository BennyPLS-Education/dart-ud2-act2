import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider() {
    loadData();
  }

  Future<List<dynamic>> loadData() async {
    final data = await rootBundle.loadString('assets/menu.json');
    final jsonData = json.decode(data);
    options = jsonData['rutes'];

    return options;
  }
}

final menuProvider = _MenuProvider();
