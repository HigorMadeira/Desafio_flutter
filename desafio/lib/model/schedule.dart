import 'dart:convert';

class Schedule {
  String time;
  List<dynamic> days;

  Schedule({
    required this.time,
    required this.days,
  });

  Map<String, dynamic> toMap() {
    return {
      'time': time,
      'days': days,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      time: map['time'] ?? '',
      days: map['days'] ?? [],
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source));
}
