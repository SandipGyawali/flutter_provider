class MovieListModel {
  int rank;
  String title;
  String description;
  String image;
  String bigImage;
  List<String> genre;
  String thumbnail;
  String rating;
  String id;
  int year;
  String imdbid;
  String imdbLink;

  MovieListModel({
    required this.rank,
    required this.title,
    required this.description,
    required this.image,
    required this.bigImage,
    required this.genre,
    required this.thumbnail,
    required this.rating,
    required this.id,
    required this.year,
    required this.imdbid,
    required this.imdbLink,
  });

  MovieListModel.fromJson(Map<String, dynamic> json)
      : rank = json['rank'] ?? 0,
        title = json['title'] ?? "",
        description = json['description'] ?? "",
        image = json['image'] ?? "",
        bigImage = json['big_image'] ?? "",
        genre = (json['genre'] as List<dynamic>).cast<String>(),
        thumbnail = json['thumbnail'] ?? "",
        rating = json['rating'] ?? "",
        id = json['id'] ?? "",
        year = json['year'] ?? 0,
        imdbid = json['imdbid'] ?? "",
        imdbLink = json['imdb_link'] ?? "";

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['rank'] = this.rank;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    data['genre'] = this.genre;
    data['thumbnail'] = this.thumbnail;
    data['rating'] = this.rating;
    data['id'] = this.id;
    data['year'] = this.year;
    data['imdbid'] = this.imdbid;
    data['imdb_link'] = this.imdbLink;
    return data;
  }

  static List<MovieListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => MovieListModel.fromJson(json)).toList();
  }
}
