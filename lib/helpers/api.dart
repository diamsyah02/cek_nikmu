import 'dart:io';
import 'package:http/http.dart' as http;
import 'exception.dart';

class Api {
  Future<dynamic> get(String? nik) async {
    var responseJson;
    try {
      final response =
          await http.get(Uri.parse('http://192.168.43.27:7777/generate-nik/${nik}'));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response;
      case 201:
        return response;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 422:
        throw InvalidInputException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
