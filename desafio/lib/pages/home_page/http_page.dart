import 'package:desafio_flutter/model/show.dart';
import 'package:desafio_flutter/pages/details/movie_detail/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:intl/intl.dart';

import '../../model/movies.dart';
import '../../repositories/episodes_repository.dart';
import '../../repositories/episodes_repository_impl.dart';
import 'mysearchdelegate.dart';
import 'http/http_controller.dart';

class HttpPage extends GetView<HttpController> {
  final EpisodesRepository episodesRepository = EpisodesRepositoryImpl();
  void getEpisodes(BuildContext context, Show show) async {
    final eps = await episodesRepository.getEpisodes(show.id);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MovieDetails(show, eps)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: MySearchDelegate());
            },
          )
        ],
      ),
      body: controller.obx((state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (_, index) {
            final MovieModel item = state[index];
            var porcentagem = (item.score * 100).round();
            var year = item.show.premiered != null && item.show.premiered != ''
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
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error),
              TextButton(
                onPressed: () => controller.getData(),
                child: Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
