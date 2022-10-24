import 'dart:convert';

import 'package:desafio_flutter/model/poster.dart';
import 'package:desafio_flutter/model/schedule.dart';

class Show {
  int id;
  String name;
  String summary;
  String premiered;
  Poster image;
  List<dynamic> genres;
  Schedule schedule;

  Show({
    required this.id,
    required this.name,
    required this.summary,
    required this.premiered,
    required this.image,
    required this.genres,
    required this.schedule,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'summary': summary,
      'premiered': premiered,
      'image': image.toJson(),
      'genres': genres,
      'schedule': schedule.toJson(),
    };
  }

  factory Show.fromMap(Map<String, dynamic> map) {
    return Show(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      summary: map['summary'] ?? '',
      premiered: map['premiered'] ?? '',
      genres: map['genres'] ?? [],
      image: Poster.fromMap(map['image']),
      schedule: Schedule.fromMap(map['schedule']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Show.fromJson(String source) => Show.fromMap(json.decode(source));
}
