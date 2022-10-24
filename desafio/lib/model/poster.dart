import 'dart:convert';

class Poster {
  String medium;
  String original;

  Poster({
    required this.medium,
    required this.original,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = medium;
    data['original'] = original;

    return data;
  }

  factory Poster.fromMap(Map<String, dynamic> map) {
    try {
      return Poster(
        medium: map['medium'] ?? '',
        original: map['original'] ?? '',
      );
    } catch (e) {
      return Poster(
        medium:
            'https://www.prestashop.com/sites/default/files/wysiwyg/404_not_found.png',
        original:
            'https://www.prestashop.com/sites/default/files/wysiwyg/404_not_found.png',
      );
    }
  }

  String toJson() => json.encode(toMap());
}
