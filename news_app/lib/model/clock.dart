import 'dart:convert';

class Clock {
  final String? timeZone;
  final DateTime? currentLocalTime;

  Clock({
    this.timeZone,
    this.currentLocalTime,
  });

  Clock copyWith({
    String? timeZone,
    DateTime? currentLocalTime,
  }) =>
      Clock(
        timeZone: timeZone ?? this.timeZone,
        currentLocalTime: currentLocalTime ?? this.currentLocalTime,
      );

  factory Clock.fromRawJson(String str) => Clock.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Clock.fromJson(Map<String, dynamic> json) => Clock(
        timeZone: json["timeZone"],
        currentLocalTime: DateTime.parse(json["currentLocalTime"]),
      );

  Map<String, dynamic> toJson() => {
        "timeZone": timeZone,
        "currentLocalTime": currentLocalTime!.toIso8601String(),
      };
}
