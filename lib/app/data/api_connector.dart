import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiConnector extends GetxController {
  Future<void> getMethodCall(
      {required String url,
      required void Function(dynamic respSuccess) onSuccess,
      required void Function(dynamic resFailure) onFailure,
      Map<String, String>? headers}) async {
    try {
      var resp = await http.get(
        Uri.parse(url),
        headers: headers,
      );
      if (resp.statusCode == 200) {
        var jsnDecoded = await jsonDecode(resp.body);
        onSuccess(jsnDecoded);
      } else {
        onFailure(resp.body);
      }
    } on http.ClientException {
      onFailure("Internet not Connected!");
    } catch (e) {
      onFailure(e.toString());
    }
  }
}
