const String tableRoutines = 'routine';

class RoutineFields {
  static final List<String> values = [
    /// Add all fields
    id, time, title, interval
  ];

  static final String id = '_id';
  static final String time = 'time';

  static final String title = 'title';
  static final String interval = 'interval';

}

class Routine {
  final int? id;
  final String time;
  final String title;
  final String interval;


  const Routine({
    this.id,
    required this.time,
    required this.title,
    required this.interval,

  });

  Routine copy({
    int? id,
    String? time,
    String? title,
    String? interval,

  }) =>
      Routine(
        id: id ?? this.id,
        time: time ?? this.time,
        title: title ?? this.title,
        interval: interval ?? this.interval,

      );

  static Routine fromJson(Map<String, Object?> json) => Routine(
    id: json[RoutineFields.id] as int?,
    time: json[RoutineFields.time] as String,
    title: json[RoutineFields.title] as String,
    interval: json[RoutineFields.interval] as String,

  );

  Map<String, Object?> toJson() => {
    RoutineFields.id: id,
    RoutineFields.time: time,
    RoutineFields.title: title,
    RoutineFields.interval: interval,

  };
}
