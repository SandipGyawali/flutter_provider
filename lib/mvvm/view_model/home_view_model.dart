import 'package:flutter/material.dart';
import 'package:flutter_provider/mvvm/data/response/api_response.dart';
import 'package:flutter_provider/mvvm/model/movie_list_model.dart';
import 'package:flutter_provider/mvvm/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  ApiResponse<List<MovieListModel>> movieList = ApiResponse.loading();
  List<MovieListModel> movies = [];

  setMovieList(ApiResponse<List<MovieListModel>> response,
      {List<MovieListModel>? data}) {
    movieList = response;
    movies = data ?? [];
    notifyListeners();
  }

  Future<void> fetchMovieListApi() async {
    try {
      setMovieList(ApiResponse.loading());
      _myRepo.fetchMovieList().then((value) {
        setMovieList(ApiResponse.success(), data: value);
      }).onError((error, stackTrace) {
        print(error);
        print(stackTrace);
        setMovieList(ApiResponse.error());
      });
    } catch (err, s) {
      print(err);
      print(s);
    }
  }
}
