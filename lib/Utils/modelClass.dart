import 'package:cloud_firestore/cloud_firestore.dart';

class UserCustom {
  final String uid;
  final String name;
  final List routine;
  final List records;

  const UserCustom({
    required this.name,
    required this.uid,
    required this.routine,
    required this.records,
  });

  static UserCustom fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return UserCustom(
      name: snapshot["username"],
      uid: snapshot["uid"],
      routine: snapshot["routine"],
      records: snapshot["records"],
    );
  }

  Map<String, dynamic> toJson() => {
        "username": name,
        "uid": uid,
        "routine": routine,
        "records": records,
      };
}

class TaskModel {
  final String startTime;
  final String endTime;

  final String title;

  // final String subTitle;

  const TaskModel({
    required this.endTime,
    required this.startTime,
    required this.title,
    // required this.subTitle,
  });

  static TaskModel fromMap(Map<String, dynamic> snapshot) {

    return TaskModel(
        endTime: snapshot['endTime'],
        title: snapshot['title'],
        startTime: snapshot['startTime']);
  }

  Map<String, dynamic> toJson() => {
        "startTime": startTime,
        "endTime": endTime,
        "title": title,
      };
}
