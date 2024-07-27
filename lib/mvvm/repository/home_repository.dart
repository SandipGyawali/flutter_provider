import 'package:flutter_provider/mvvm/data/app_exception.dart';
import 'package:flutter_provider/mvvm/model/movie_list_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeRepository {
  Future<List<MovieListModel>> fetchMovieList() async {
    final String? apiUrl = dotenv.env["RAPID_API_URI_ENDPOINT"];
    final String? apiKey = dotenv.env["RAPID_API_KEY"];
    final String? apiHost = dotenv.env["RAPI_API_HOST"];

    if (apiUrl == null || apiKey == null || apiHost == null) {
      print('Environment variables are not set correctly');
      throw FetchDataException("Error while fetching");
    }

    final Uri url = Uri.parse(apiUrl);
    final Map<String, String> headers = {
      'x-rapidapi-key': apiKey,
      'x-rapidapi-host': apiHost,
    };

    try {
      final response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var decodedResponse = MovieListModel.fromJsonList(data);

        print("response body ------> ${response.body}");
        return decodedResponse;
      } else {
        print('Failed to load movie list: ${response.statusCode}');
        throw FetchDataException(
            "Failed to load movie list: ${response.statusCode}");
      }
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      throw FetchDataException("Error while fetching data");
    }
  }
}
