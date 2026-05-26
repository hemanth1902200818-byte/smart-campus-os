class StudentModel {
  final String id;
  final String name;
  final String email;
  final String usn;
  final int attendance;
  final int marks;
  final String hostel;
  final String bus;
  final String todayAttendance;

  StudentModel({
    required this.id,
    required this.name,
    required this.email,
    required this.usn,
    required this.attendance,
    required this.marks,
    required this.hostel,
    required this.bus,
    required this.todayAttendance,
  });

  factory StudentModel.fromMap(String id, Map<String, dynamic> data) {
    return StudentModel(
      id: id,
      name: data['name'] ?? 'Student',
      email: data['email'] ?? '',
      usn: data['usn'] ?? '',
      attendance: data['attendance'] ?? 0,
      marks: data['marks'] ?? 0,
      hostel: data['hostel'] ?? 'Not assigned',
      bus: data['bus'] ?? 'Not assigned',
      todayAttendance: data['todayAttendance'] ?? 'Not Marked',
    );
  }
}