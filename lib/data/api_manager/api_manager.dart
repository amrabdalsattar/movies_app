import 'dart:convert';

import 'package:http/http.dart' as ht;
import 'package:movies_app/data/model/geners_dm.dart';
import 'package:movies_app/data/model/new_release_response.dart';
import 'package:movies_app/data/model/popular_response.dart';
import 'package:movies_app/data/model/search_response.dart';
import 'package:movies_app/data/model/similar_response.dart';
import 'package:movies_app/data/model/top_rated_response.dart';

import '../model/MovieDetailsModel.dart';

class ApiManager {
  static const String apiKey = "f43f8f43fae767fae41cfa6ba1d97d8d";
  static const String baseUrl = "api.themoviedb.org/3/";
  static const String popularEndPoint = "movie/popular";
  static const String newReleaseEndPoint = "movie/upcoming";
  static const String topRatedEndPoint = "movie/top_rated";
  static const String detailsEndPoint = "movie/";

  static Future<List<PopularResult>> getPopular() async {
    Uri url = Uri.parse("https://$baseUrl$popularEndPoint?api_key=$apiKey");
    ht.Response response = await ht.get(url);
    Map json = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        popularResponse.results?.isNotEmpty == true) {
      return popularResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<List<NewReleaseResult>> getNewRelease() async {
    Uri url = Uri.parse("https://$baseUrl$newReleaseEndPoint?api_key=$apiKey");
    ht.Response response = await ht.get(url);
    Map json = jsonDecode(response.body);
    NewReleaseResponse newReleaseResponse = NewReleaseResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        newReleaseResponse.results?.isNotEmpty == true) {
      return newReleaseResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<List<TopRatedResult>> getTopRated() async {
    Uri url = Uri.parse("https://$baseUrl$topRatedEndPoint?api_key=$apiKey");
    ht.Response response = await ht.get(url);
    Map json = jsonDecode(response.body);
    TopRatedResponse topRatedResponse = TopRatedResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        topRatedResponse.results?.isNotEmpty == true) {
      return topRatedResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<MovieDetailsModel> fetchMovieDetails(num? movieId) async {
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDNmOGY0M2ZhZTc2N2ZhZTQxY2ZhNmJhMWQ5N2Q4ZCIsInN1YiI6IjY1NDNkM2U0ZTFhZDc5MDEwYmNlZmVlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kzuKpANkmRWV0DRTZ7zvUO89EOKSMuADq0-4e1nqyKo'
    };

    var url = Uri.https("api.themoviedb.org", "3/movie/" "$movieId");

    var response = await ht.get(url, headers: headers);

    // print(response.body);
    var jsn = jsonDecode(response.body);
    MovieDetailsModel movie = MovieDetailsModel.fromJson(jsn);

    return movie;
  }

  static Future<List<SimilarResult>> getSimilar(num? movieId) async {
    var headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDNmOGY0M2ZhZTc2N2ZhZTQxY2ZhNmJhMWQ5N2Q4ZCIsInN1YiI6IjY1NDNkM2U0ZTFhZDc5MDEwYmNlZmVlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kzuKpANkmRWV0DRTZ7zvUO89EOKSMuADq0-4e1nqyKo'
    };

    var url = Uri.https("api.themoviedb.org", "3/movie/" "$movieId/similar");

    var response = await ht.get(url, headers: headers);

    var jsn = jsonDecode(response.body);
    SimilarResponse movies = SimilarResponse.fromJson(jsn);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        movies.results?.isNotEmpty == true) {
      return movies.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<List<SearchResults>> getSearch(String? q, {num? id}) async {
    var headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDNmOGY0M2ZhZTc2N2ZhZTQxY2ZhNmJhMWQ5N2Q4ZCIsInN1YiI6IjY1NDNkM2U0ZTFhZDc5MDEwYmNlZmVlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kzuKpANkmRWV0DRTZ7zvUO89EOKSMuADq0-4e1nqyKo'
    };

    Uri url =
    Uri.parse
      ( id == null ?
        "https://api.themoviedb.org/3/search/movie?query=$q&include_adult=false"
        :
    "https://api.themoviedb.org/3/search/movie?query=$q&include_adult=false&id=$id"
    );

    var response = await ht.get(url, headers: headers);

    var jsn = jsonDecode(response.body);
    SearchResponse movies = SearchResponse.fromJson(jsn);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        movies.results?.isNotEmpty == true) {
      return movies.results!;
    }
    throw Exception("There is no Matched Movies, Please Enter a valid Key Word");
  }

  static Future<List<Genre>?> getGenres() async {
    var headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDNmOGY0M2ZhZTc2N2ZhZTQxY2ZhNmJhMWQ5N2Q4ZCIsInN1YiI6IjY1NDNkM2U0ZTFhZDc5MDEwYmNlZmVlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kzuKpANkmRWV0DRTZ7zvUO89EOKSMuADq0-4e1nqyKo'
    };

    Uri url = Uri.parse("https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey");
    ht.Response response = await ht.get(url);
    Map json = jsonDecode(response.body);
    GenresDm genresDm = GenresDm.fromJson(json);

    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        genresDm.genres?.isNotEmpty == true) {
      return genresDm.genres;
    }
    throw Exception("Something Went Wrong");
  }
}
