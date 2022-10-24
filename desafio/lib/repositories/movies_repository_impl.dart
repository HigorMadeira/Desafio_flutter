import 'dart:convert';
import 'package:desafio_flutter/model/episode.dart';
import '../model/movies.dart';
import 'movies_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<MovieModel>> getData() async {
    final response =
        await http.get('https://api.tvmaze.com/search/shows?q=rings');
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<MovieModel>((resp) => MovieModel.fromMap(resp))
        .toList();
  }

  @override
  Future<List<MovieModel>> searchData(String q) async {
    final response = await http.get('https://api.tvmaze.com/search/shows?q=$q');
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap
        .map<MovieModel>((resp) => MovieModel.fromMap(resp))
        .toList();
  }
}
