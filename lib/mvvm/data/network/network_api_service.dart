import 'dart:convert';
import 'dart:io';

import 'package:flutter_provider/mvvm/data/app_exception.dart';
import 'package:flutter_provider/mvvm/data/network/base_api_services.dart';
import "package:http/http.dart" as http;

class NetworkApiService extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson; //contains the json data from the response;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } catch (err) {
      throw FetchDataException("Error in network while fetching");
    }

    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }

    return responseJson;
  }
}

// response handler based on the status code.
dynamic returnResponse(http.Response response) {
  switch (response) {
    case 200:
      dynamic jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    case 400:
      throw BadRequestException(response.body.toString());
    case 500:
    case 404:
    default:
      throw FetchDataException(
          "Error while communicating with the server with status code: ${response.statusCode}");
  }
}
