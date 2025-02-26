import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hcricket/data/network/base_api_servies.dart';
import 'package:hcricket/exception/app_exceptions.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';

class NetworkApiService implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    if (kDebugMode) {
      log('API URL: $url');
    }

    // Define headers
    final headers = {
      'x-rapidapi-host': "cricbuzz-cricket2.p.rapidapi.com",

      // 'x-rapidapi-key': "078ce85b94msh1b269d515b4a326p189567jsn3ec8cca554b3",

      // 'x-rapidapi-key': "7dd4099436mshf3e78acb2fa0bc9p111deejsn99c99ebf75f0",

      // 'x-rapidapi-key': "e3b1f25c83mshaf3a7732e592241p1f5371jsnbfa394055dfc",

      'x-rapidapi-key': "4417f26feamsha285e770251d421p1bb332jsn7c8666363bbe",

      // 'x-rapidapi-key': "7fe82018acmsh6a8de478a351f4bp1f3227jsn8b872840a661",

      // 'x-rapidapi-key': "ba27e082d3msh3654e4c48a95700p134f18jsnd2e1ee7e9896",

      // 'x-rapidapi-key': "447d2ec4f5msh23c6174b7e8b2a4p1f88b3jsn3bbb2ff67dc0",
    };

    try {
      // Make the HTTP GET request
      final response = await http.get(Uri.parse(url), headers: headers);

      // Log the raw response body
      if (kDebugMode) {
        log('Response Status: ${response.statusCode}');
        // log('Response Body: ${response.body}');
      }

      // Validate and return the response
      return returnResponse(response);
    } on SocketException {
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('Request Timed Out');
    } catch (e) {
      log('Unexpected error: $e');
      throw Exception('Something went wrong: $e');
    }
  }

  @override
  Future<dynamic> postApi(String url, dynamic data) async {
    if (kDebugMode) {
      print(url);
      print(data);
    }

    dynamic responseJson;
    try {
      final Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw FetchDataException('Network Request time out');
    }

    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    if (kDebugMode) {
      print(response.statusCode);
    }

    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        if (response.body.isNotEmpty) {
          return jsonDecode(response.body);
        } else {
          return {print("empty")};
        }

      case 204:
        return null;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 401:
        throw BadRequestException(response.body.toString());
      case 500:
      case 404:
        throw UnauthorisedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error occurred while communicating with server');
    }
  }
}
