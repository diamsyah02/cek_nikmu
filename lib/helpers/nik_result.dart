import 'dart:convert';

import 'package:cek_nikmu/models/nik_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NIKResult {
  Future setResult(NIKModel value) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.setString("result_generate", jsonEncode(value));
  }

  Future<String?> getResult() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getString("result_generate");
  }
}
