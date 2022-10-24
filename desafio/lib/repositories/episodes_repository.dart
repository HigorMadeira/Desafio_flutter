import '../model/episode.dart';

abstract class EpisodesRepository {
  Future<List<Episode>> getEpisodes(int id);
}
