import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  static final FirebaseFirestore db = FirebaseFirestore.instance;

  static String todayDate() {
    final now = DateTime.now();
    final month = now.month.toString().padLeft(2, '0');
    final day = now.day.toString().padLeft(2, '0');
    return "${now.year}-$month-$day";
  }

  static Future<void> addNotification(String message) async {
    await db.collection('notifications').add({
      'message': message,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  static Future<void> createDemoStudentsIfNeeded() async {
    Future<void> ensureStudent({
      required String id,
      required String name,
      required String email,
      required String usn,
      required int attendance,
      required int marks,
      required String hostel,
      required String bus,
    }) async {
      final ref = db.collection('students').doc(id);
      final doc = await ref.get();

      if (!doc.exists) {
        await ref.set({
          'name': name,
          'email': email,
          'usn': usn,
          'attendance': attendance,
          'marks': marks,
          'hostel': hostel,
          'bus': bus,
          'todayAttendance': 'Not Marked',
          'lastAttendanceDate': '',
          'attendedClasses': attendance,
          'totalClasses': 100,
          'createdAt': FieldValue.serverTimestamp(),
        });
      } else {
        await ref.set({
          'name': name,
          'email': email,
          'usn': usn,
          'hostel': hostel,
          'bus': bus,
        }, SetOptions(merge: true));
      }
    }

    await ensureStudent(
      id: 'student1',
      name: 'Hemanth M',
      email: 'hemanth@student.com',
      usn: '1DS26CS001',
      attendance: 72,
      marks: 68,
      hostel: 'B-204',
      bus: 'Route 3',
    );

    await ensureStudent(
      id: 'student2',
      name: 'Priyadarshini',
      email: 'priya@student.com',
      usn: '1DS26CS002',
      attendance: 80,
      marks: 75,
      hostel: 'A-105',
      bus: 'Route 5',
    );

    await ensureStudent(
      id: 'student3',
      name: 'Naveen',
      email: 'naveen@student.com',
      usn: '1DS26CS003',
      attendance: 88,
      marks: 82,
      hostel: 'C-302',
      bus: 'Route 2',
    );

    await ensureStudent(
      id: 'student4',
      name: 'Ranjitha Vishwanath',
      email: 'ranjitha@student.com',
      usn: '1DS26CS004',
      attendance: 76,
      marks: 79,
      hostel: 'D-110',
      bus: 'Route 4',
    );
  }

  static Stream<QuerySnapshot> allStudentsStream() {
    return db.collection('students').snapshots();
  }

  static Stream<QuerySnapshot> studentByEmailStream(String email) {
    return db
        .collection('students')
        .where('email', isEqualTo: email.toLowerCase())
        .snapshots();
  }

  static Stream<QuerySnapshot> notificationsStream() {
    return db.collection('notifications').snapshots();
  }

  static Future<void> addStudent({
    required String name,
    required String email,
    required String usn,
    required int attendance,
    required int marks,
    required String hostel,
    required String bus,
  }) async {
    await db.collection('students').add({
      'name': name,
      'email': email.toLowerCase(),
      'usn': usn,
      'attendance': attendance,
      'marks': marks,
      'hostel': hostel.isEmpty ? 'Not assigned' : hostel,
      'bus': bus.isEmpty ? 'Not assigned' : bus,
      'todayAttendance': 'Not Marked',
      'lastAttendanceDate': '',
      'attendedClasses': attendance,
      'totalClasses': 100,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await addNotification("Admin added new student: $name");
  }

  static Future<int> deleteStudentByDetails({
    required String name,
    required String email,
    required String usn,
  }) async {
    final query = await db
        .collection('students')
        .where('name', isEqualTo: name)
        .where('email', isEqualTo: email.toLowerCase())
        .where('usn', isEqualTo: usn)
        .get();

    for (var doc in query.docs) {
      await doc.reference.delete();
    }

    if (query.docs.isNotEmpty) {
      await addNotification("Admin deleted student: $name");
    }

    return query.docs.length;
  }

  static Future<void> updateMarks({
    required String studentId,
    required String studentName,
    required int marks,
  }) async {
    await db.collection('students').doc(studentId).update({
      'marks': marks,
    });

    await addNotification("Internal marks uploaded for $studentName");
  }

  static Future<void> sendStudentAnnouncement({
    required String studentId,
    required String studentName,
    required String message,
  }) async {
    await db
        .collection('students')
        .doc(studentId)
        .collection('announcements')
        .add({
      'message': message,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await addNotification("Announcement for $studentName: $message");
  }

  static Future<void> markAttendance({
    required String studentId,
    required String studentName,
    required bool isPresent,
  }) async {
    final ref = db.collection('students').doc(studentId);
    final snap = await ref.get();
    final data = snap.data() ?? {};

    final today = todayDate();

    int currentAttendance = data['attendance'] ?? 0;
    int attendedClasses = data['attendedClasses'] ?? currentAttendance;
    int totalClasses = data['totalClasses'] ?? 100;

    String previousDate = data['lastAttendanceDate'] ?? "";
    String previousStatus = data['todayAttendance'] ?? "Not Marked";

    if (previousDate != today) {
      totalClasses += 1;
      if (isPresent) {
        attendedClasses += 1;
      }
    } else {
      if (previousStatus == "Present" && !isPresent) {
        attendedClasses -= 1;
      } else if (previousStatus == "Absent" && isPresent) {
        attendedClasses += 1;
      }
    }

    if (attendedClasses < 0) attendedClasses = 0;

    int newAttendance =
        totalClasses == 0 ? 0 : ((attendedClasses / totalClasses) * 100).round();

    String status = isPresent ? "Present" : "Absent";

    await ref.update({
      'todayAttendance': status,
      'lastAttendanceDate': today,
      'attendedClasses': attendedClasses,
      'totalClasses': totalClasses,
      'attendance': newAttendance,
    });

    await ref.collection('attendanceLogs').doc(today).set({
      'date': today,
      'status': status,
      'createdAt': FieldValue.serverTimestamp(),
    });

    await addNotification("$studentName marked $status");
  }
}