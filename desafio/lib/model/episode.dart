import 'dart:convert';

import 'package:desafio_flutter/model/poster.dart';
import 'package:desafio_flutter/model/show.dart';

class Episode {
  int season;
  int number;
  String name;
  String summary;
  Poster image;

  Episode({
    required this.season,
    required this.number,
    required this.name,
    required this.image,
    required this.summary,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['season'] = this.season;
    data['number'] = this.number;
    data['name'] = this.name;
    data['image'] = image.toJson();
    data['summary'] = this.summary;

    return data;
  }

  factory Episode.fromMap(Map<String, dynamic> map) {
    return Episode(
      season: map['season'],
      number: map['number'],
      name: map['name'] ?? '',
      image: Poster.fromMap(map['image']),
      summary: map['summary'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
