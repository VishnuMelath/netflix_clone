import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/api/constants.dart';
import 'package:netflix_clone/data%20model/movies.dart';

List<Movies> trendingMovies = [];
List<Movies> upcomingMovies = [];
List<Movies> popularMovies = [];
List<Movies> tvshows = [];

class Api {
  static const _trendingUrl =
      'https://api.themoviedb.org/3/trending/all/day?api_key=${Constants.apikey}';
  static const _upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}';
  static const _popularUrl =
      'https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apikey}';

  static const _tvshowsUrl =
      'https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apikey}';

  Future getPopularMovies() async {
    final response = await http.get(Uri.parse(_popularUrl));

    if (response.statusCode == 200) {
      final List decodedData = json.decode(response.body)['results'];
      for (var element in decodedData) {
        popularMovies.add(Movies(
            title: element['title'],
            backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            originalTitle: element['original_title'],
            overview: element['overview'],
            posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            releaseDate: element['release_date'],
            voteAvg: element['vote_average'],
            genre: element['genre_ids']));
      }
      popularMovies.length;
    }
  }

  Future getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));

    if (response.statusCode == 200) {
      final List decodedData = json.decode(response.body)['results'];
      for (var element in decodedData) {
        if (element['media_type'] == 'movie') {
          trendingMovies.add(Movies(
            title: element['title'],
            backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            originalTitle: element['original_title'],
            overview: element['overview'],
            posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            releaseDate: element['release_date'],
            voteAvg: element['vote_average'],
            genre: element['genre_ids'],
          ));
        } else if (element['media_type'] == 'tv') {
          trendingMovies.add(Movies(
              genre: element['genre_ids'],
              title: element['original_name'],
              backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
              originalTitle: element['original_name'],
              overview: element['overview'],
              posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
              releaseDate: element['first_air_date'],
              voteAvg: element['vote_average']));
        }
      }
    }
  }

  Future getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_upcomingUrl));

    if (response.statusCode == 200) {
      final List decodedData = json.decode(response.body)['results'];
      for (var element in decodedData) {
        upcomingMovies.add(Movies(
            genre: element['genre_ids'],
            title: element['title'],
            backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            originalTitle: element['original_title'],
            overview: element['overview'],
            posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            releaseDate: element['release_date'],
            voteAvg: element['vote_average']));
      }
    }
  }

  Future getTVShows() async {
    final response = await http.get(Uri.parse(_tvshowsUrl));

    if (response.statusCode == 200) {
      final List decodedData = json.decode(response.body)['results'];
      for (var element in decodedData) {
        tvshows.add(Movies(
            genre: element['genre_ids'],
            title: element['original_name'],
            backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            originalTitle: element['original_name'],
            overview: element['overview'],
            posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            releaseDate: element['first_air_date'],
            voteAvg: element['vote_average']));
      }
    }
  }

  Future<List<Movies>> searchMovies(String query) async {
    List<Movies> searchList = [];
    final searchUrl =
        'https://api.themoviedb.org/3/search/multi?api_key=${Constants.apikey}&query=$query';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final List decodedData = json.decode(response.body)['results'];
      for (var element in decodedData) {
        if (element['media_type'] == 'movie') {
          searchList.add(Movies(
            title: element['title'],
            backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
            originalTitle: element['original_title'],
            overview: element['overview'],
            posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/rubaKfmdCvWGPXErgW9aQsgzKVr.jpg',
            releaseDate: element['release_date'],
            voteAvg: element['vote_average'],
            genre: element['genre_ids'],
          ));
        } else if (element['media_type'] == 'tv') {
          searchList.add(Movies(
              genre: element['genre_ids'],
              title: element['original_name'],
              backdroppath: element['backdrop_path']??'https://image.tmdb.org/t/p/w500/o25js6DbhDa9KtMKUiGOEPVSnaP.jpg',
              originalTitle: element['original_name'],
              overview: element['overview']??'',
              posterPath: element['poster_path']??'https://image.tmdb.org/t/p/w500/rubaKfmdCvWGPXErgW9aQsgzKVr.jpg',
              releaseDate: element['first_air_date'],
              voteAvg: element['vote_average']));
        }
      }
    }
    print(searchList.length);
    return searchList;
  }
}
