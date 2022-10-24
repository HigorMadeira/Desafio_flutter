import 'dart:convert';
import 'package:desafio_flutter/model/episode.dart';
import 'package:desafio_flutter/repositories/episodes_repository.dart';

import 'package:http/http.dart' as http;

class EpisodesRepositoryImpl implements EpisodesRepository {
  @override
  Future<List<Episode>> getEpisodes(int id) async {
    final response =
        await http.get('https://api.tvmaze.com/shows/$id/episodes');
    final List<dynamic> responseMap = jsonDecode(response.body);
    return responseMap.map<Episode>((resp) => Episode.fromMap(resp)).toList();
  }
}
