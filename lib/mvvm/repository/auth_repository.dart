import 'package:flutter_provider/mvvm/data/network/base_api_services.dart';
import 'package:flutter_provider/mvvm/data/network/network_api_service.dart';
import 'package:flutter_provider/mvvm/resources/app_url.dart';

class AuthRepository {
  // parent class reference with child class entity.
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApiResponse(
        AppUrl.loginEndPoint,
        data,
      );
      return response;
    } catch (err) {
      throw err;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.postApiResponse(
        AppUrl.registerEndpoint,
        data,
      );
      return response;
    } catch (err) {
      throw err;
    }
  }
}
