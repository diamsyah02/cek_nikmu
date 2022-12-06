import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cek_nikmu/helpers/api.dart';
import 'package:cek_nikmu/models/nik_model.dart';

class NIKBloc {
  static Future<NIKModel> generateNIK({ String? nik }) async {
    var response = await Api().get(nik);
    var jsonObj = json.decode(response.body);
    var mapping = (jsonObj as Map<String, dynamic>)['data'];
    NIKModel result = NIKModel.fromJson(mapping);
    return result;
  }
}
