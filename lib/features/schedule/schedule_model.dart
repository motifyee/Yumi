import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Schedule {
  String guid;
  String userId;

  bool? saturdayActive;
  String? saturdayStart;
  String? saturdayEnd;

  bool? sundayActive;
  String? sundayStart;
  String? sundayEnd;

  bool? mondayActive;
  String? mondayStart;
  String? mondayEnd;

  bool? tuesdayActive;
  String? tuesdayStart;
  String? tuesdayEnd;

  bool? wednesdayActive;
  String? wednesdayStart;
  String? wednesdayEnd;

  bool? thursdayActive;
  String? thursdayStart;
  String? thursdayEnd;

  bool? fridayActive;
  String? fridayStart;
  String? fridayEnd;

  Schedule({
    required this.guid,
    required this.userId,
    this.saturdayActive,
    this.saturdayStart,
    this.saturdayEnd,
    this.sundayActive,
    this.sundayStart,
    this.sundayEnd,
    this.mondayActive,
    this.mondayStart,
    this.mondayEnd,
    this.tuesdayActive,
    this.tuesdayStart,
    this.tuesdayEnd,
    this.wednesdayActive,
    this.wednesdayStart,
    this.wednesdayEnd,
    this.thursdayActive,
    this.thursdayStart,
    this.thursdayEnd,
    this.fridayActive,
    this.fridayStart,
    this.fridayEnd,
  });

  

}

// class ScheduleRepository {
//   final FirebaseFirestore _firestore;
//   final FirebaseAuth _auth;

//   ScheduleRepository(this._firestore, this._auth);

//   Future<Schedule?> getSchedule() async {
//     final user = _auth.currentUser;
//     if (user == null) {
//       return null;
//     }

//     final snapshot =
//         await _firestore.collection('schedules').doc(user.uid).get();

//     if (snapshot.exists) {
//       return Schedule.fromJson(snapshot.data()!);
//     }

//     return null;
//   }

//   Future<void> setSchedule(Schedule schedule) async {
//     final user = _auth.currentUser;
//     if (user == null) {
//       return;
//     }

//     await _firestore
//         .collection('schedules')
//         .doc(user.uid)
//         .set(schedule.toJson());
//   }
}
