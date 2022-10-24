import 'dart:convert';

import 'package:desafio_flutter/model/show.dart';

class MovieModel {
  double score;
  Show show;

  MovieModel({
    required this.score,
    required this.show,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = score;
    data['show'] = show.toJson();
    return data;
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
        score: map['score'] ?? '', show: Show.fromMap(map['show']));
  }

  String toJson() => json.encode(toMap());
}
