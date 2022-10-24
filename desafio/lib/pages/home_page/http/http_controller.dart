import 'package:desafio_flutter/repositories/movies_repository.dart';
import 'package:get/get.dart';

import '../../../model/show.dart';

class HttpController extends GetxController with StateMixin {
  final MovieRepository _httpRepository;

  HttpController(this._httpRepository);

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _httpRepository.getData();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro'));
    }
  }

  Future<void> searchData(String q) async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _httpRepository.searchData(q);
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro'));
    }
  }
}
