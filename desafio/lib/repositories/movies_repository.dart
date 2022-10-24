import '../model/movies.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getData();
  Future<List<MovieModel>> searchData(String q);
}
