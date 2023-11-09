import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/model/details_response.dart';
import 'package:movies_app/data/model/new_release_response.dart';
import 'package:movies_app/data/model/popular_response.dart';
import 'package:movies_app/data/model/top_rated_response.dart';

class ApiManager{
  static const String apiKey = "f43f8f43fae767fae41cfa6ba1d97d8d";
  static const String baseUrl = "api.themoviedb.org";
  static const String popularEndPoint = "/3/movie/popular";
  static const String newReleaseEndPoint = "/3/movie/upcoming";
  static const String topRatedEndPoint = "/3/movie/top_rated";
  static const String detailsEndPoint = "/3/movie/";

  static Future<List<PopularResult>> getPopular() async{
    Uri url = Uri.parse("https://$baseUrl$popularEndPoint?api_key=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    PopularResponse popularResponse = PopularResponse.fromJson(json);
    if (response.statusCode >= 200 &&
        response.statusCode < 300 &&
        popularResponse.results?.isNotEmpty == true) {
      return popularResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<List<NewReleaseResult>> getNewRelease() async{
    Uri url = Uri.parse("https://$baseUrl$newReleaseEndPoint?api_key=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    NewReleaseResponse newReleaseResponse = NewReleaseResponse.fromJson(json);
    if(response.statusCode >= 200 &&
       response.statusCode < 300 &&
    newReleaseResponse.results?.isNotEmpty == true){
      return newReleaseResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }

  static Future<List<TopRatedResult>> getTopRated() async{
    Uri url = Uri.parse("https://$baseUrl$topRatedEndPoint?api_key=$apiKey");
    Response response = await get(url);
    Map json = jsonDecode(response.body);
    TopRatedResponse topRatedResponse = TopRatedResponse.fromJson(json);
    if(response.statusCode >= 200 &&
        response.statusCode < 300 &&
        topRatedResponse.results?.isNotEmpty == true){
      return topRatedResponse.results!;
    }
    throw Exception("Something Went Wrong");
  }



  static Future<void> fetchMovieDetails(int movieId) async {
    var headers = {
      'Authorization':
      'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmNDNmOGY0M2ZhZTc2N2ZhZTQxY2ZhNmJhMWQ5N2Q4ZCIsInN1YiI6IjY1NDNkM2U0ZTFhZDc5MDEwYmNlZmVlNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.kzuKpANkmRWV0DRTZ7zvUO89EOKSMuADq0-4e1nqyKo\' \\'
    };
    var request = Request('GET',
        Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=f43f8f43fae767fae41cfa6ba1d97d8d'));

    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }

  }

}