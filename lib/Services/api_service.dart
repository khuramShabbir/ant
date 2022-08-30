import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiServices {
  static Map<String, String> headers = {'Content-Type': 'application/json'};

  static Map<String, String> headersWithToken = {
    'Authorization': LocalStorage.getToken(),
    'Content-Type': 'application/json'
  };

  static Future<String> simplePostWithBody({
    required String feedUrl,
    required Map<String, dynamic> body,
    bool headerWithToken = false,
  }) async {
    AppWidgets.showProgress();

    var request = http.Request('POST', Uri.parse(ApiUrls.BASE_URL + feedUrl));

    request.headers.addAll(headerWithToken ? headersWithToken : headers);
    request.body = json.encode(body);

    http.StreamedResponse response = await request.send();

    String resBody = await response.stream.bytesToString();
    logger.e(resBody);
    AppWidgets.stopProgress();

    if (response.statusCode == 200 || response.statusCode == 201) {
      return resBody;
    } else {
      return "";
    }
  }

  static Future<String> simplePutWithBody({
    required String feedUrl,
    required Map<String, dynamic> body,
  }) async {
    AppWidgets.showProgress();

    Map<String, String> headers = {
      'Authorization': LocalStorage.getToken(),
      'Content-Type': 'application/json'
    };
    logger.i(headers);

    var request = http.Request('PUT', Uri.parse(ApiUrls.BASE_URL + feedUrl));

    request.headers.addAll(headers);
    request.body = json.encode(body);

    http.StreamedResponse response = await request.send();

    String resBody = await response.stream.bytesToString();
    logger.e(resBody);

    AppWidgets.stopProgress();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return resBody;
    } else {
      return "";
    }
  }

  static Future<String> simpleDelete({required String feedUrl, required String googleId}) async {
    AppWidgets.showProgress();
    Map<String, String> headers = {
      'Authorization': LocalStorage.getToken(),
      'Content-Type': 'application/json'
    };
    var request = http.Request('DELETE', Uri.parse(ApiUrls.BASE_URL + feedUrl + googleId));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    String resBody = await response.stream.bytesToString();
    logger.e(resBody);

    AppWidgets.stopProgress();
    if (response.statusCode == 200 || response.statusCode == 201) {
      return resBody;
    } else {
      return "";
    }
  }
}
