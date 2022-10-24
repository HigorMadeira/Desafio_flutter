import 'package:desafio_flutter/model/episode.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../../model/show.dart';
import '../../home_page/http/http_controller.dart';

class EpisodeDetail extends GetView<HttpController> {
  final Episode zk;
  EpisodeDetail(this.zk);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text(zk.name)),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image.network(zk.image.medium),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(zk.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Temporada ' +
                        zk.season.toString() +
                        ' - ' +
                        'episódio ' +
                        zk.number.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(zk.summary),
                  )
                ]))));
  }
}
