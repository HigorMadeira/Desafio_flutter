import 'package:desafio_flutter/pages/details/episode_detail/episode_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../model/episode.dart';
import '../../../model/show.dart';
import '../../home_page/http/http_controller.dart';

class MovieDetails extends GetView<HttpController> {
  final Show movie;
  final List<Episode> eps;
  MovieDetails(this.movie, this.eps);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(movie.image.medium),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.name),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(movie.summary),
              ),
              SizedBox(
                height: 75,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: movie.genres.length,
                    itemBuilder: (_, index) {
                      var item = movie.genres[index];
                      return Text(item);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: movie.schedule.days.length,
                    itemBuilder: (_, index) {
                      var item = movie.schedule.days[index];
                      return Text(item + ' - ' + movie.schedule.time);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 460,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: eps.length,
                    itemBuilder: (_, index) {
                      var item = eps[index];
                      return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: ListTile(
                            leading: Image.network(item.image.medium),
                            title: Text(item.name),
                            subtitle: Text('Temporada ' +
                                item.season.toString() +
                                ' - ' +
                                'episódio ' +
                                item.number.toString()),
                            trailing: Icon(Icons.arrow_forward_rounded),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          EpisodeDetail(item)));
                            },
                          ));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
