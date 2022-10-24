import 'package:desafio_flutter/model/movies.dart';
import 'package:desafio_flutter/model/show.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../repositories/episodes_repository.dart';
import '../../repositories/episodes_repository_impl.dart';
import '../../repositories/movies_repository.dart';
import '../../repositories/movies_repository_impl.dart';
import '../details/movie_detail/movie_details.dart';

class MySearchDelegate extends SearchDelegate {
  final MovieRepository movieRepository = MovieRepositoryImpl();

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        // TODO: implement buildLeading
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );
  Future<List<MovieModel>> searchData() async {
    var ww = query.toLowerCase();
    List<MovieModel> result = await movieRepository.searchData(ww);
    return result;
  }

  final EpisodesRepository episodesRepository = EpisodesRepositoryImpl();
  void getEpisodes(BuildContext context, Show show) async {
    final eps = await episodesRepository.getEpisodes(show.id);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieDetails(show, eps)));
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
      future: searchData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (_, index) {
              var data = snapshot.data != null ? snapshot.data : [];
              final MovieModel item = data?[index];
              var porcentagem = (item.score * 100).round();
              var year = item.show.premiered != null &&
                      item.show.premiered != ''
                  ? ' - ' +
                      DateFormat.y().format(DateTime.parse(item.show.premiered))
                  : '';
              return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: Image.network(item.show.image.medium),
                    title: Text(item.show.name),
                    subtitle: Text(porcentagem.toString() + '%' + ' $year'),
                    trailing: Icon(Icons.arrow_forward_rounded),
                    onTap: () {
                      getEpisodes(context, item.show);
                    },
                  ));
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [];
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
            title: Text(suggestions as String),
            onTap: () {
              query = suggestions as String;
            });
      },
    );
  }
}
