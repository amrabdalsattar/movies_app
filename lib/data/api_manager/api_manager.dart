import 'dart:convert';

import 'package:http/http.dart';
import 'package:movies_app/data/model/new_release_response.dart';
import 'package:movies_app/data/model/popular_response.dart';
import 'package:movies_app/data/model/top_rated_response.dart';

class ApiManager{
  static const String apiKey = "f43f8f43fae767fae41cfa6ba1d97d8d";
  static const String baseUrl = "api.themoviedb.org";
  static const String popularEndPoint = "/3/movie/popular";
  static const String newReleaseEndPoint = "/3/movie/upcoming";
  static const String topRatedEndPoint = "/3/movie/top_rated";

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
}