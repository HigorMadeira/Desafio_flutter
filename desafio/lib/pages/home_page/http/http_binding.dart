import 'package:desafio_flutter/repositories/movies_repository_impl.dart';
import 'package:get/get.dart';
import '../../../repositories/movies_repository.dart';
import 'http_controller.dart';

class HttpBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MovieRepository>(MovieRepositoryImpl());
    Get.put(HttpController(Get.find()));
  }
}
