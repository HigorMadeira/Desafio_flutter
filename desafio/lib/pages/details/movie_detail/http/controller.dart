import 'package:desafio_flutter/repositories/movies_repository.dart';
import 'package:get/get.dart';

import '../../../../repositories/episodes_repository.dart';

class EpisodesController extends GetxController with StateMixin {
  final EpisodesRepository _movieRepository;

  EpisodesController(this._movieRepository);

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getEpisodes(int id) async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _movieRepository.getEpisodes(id);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro'));
    }
  }
}
