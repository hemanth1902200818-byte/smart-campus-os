import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_state.dart';
import '../backend/firestore_service.dart';
import '../models/student_model.dart';
import '../widegets/app_widgets.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  String risk(int attendance, int marks) {
    if (attendance < 75 && marks < 70) return "High Risk";
    if (attendance < 80) return "Medium Risk";
    return "Safe";
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> stream = AppState.role == "Student"
        ? FirestoreService.studentByEmailStream(AppState.email)
        : FirestoreService.allStudentsStream();

    return StreamBuilder<QuerySnapshot>(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return const Center(child: Text("Firebase error while loading students"));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                AppState.role == "Student"
                    ? "No student record found for this email.\nAsk admin to add this email."
                    : "No student data found",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ),
          );
        }

        final docs = snapshot.data!.docs;

        return ListView(
          padding: const EdgeInsets.all(18),
          children: [
            Text(
              AppState.role == "Student"
                  ? "My Student Dashboard"
                  : "Student Dashboard",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 14),

            Text(
              AppState.role == "Student"
                  ? "Showing details for: ${AppState.email}"
                  : "All students data from Firebase",
              style: const TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 14),

            ...docs.map((doc) {
              final student = StudentModel.fromMap(
                doc.id,
                doc.data() as Map<String, dynamic>,
              );

              final aiRisk = risk(student.attendance, student.marks);

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${student.name} - ${student.usn}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Text(
                        student.email,
                        style: const TextStyle(color: Colors.grey),
                      ),

                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: MiniInfoCard(
                              title: "Attendance",
                              value: "${student.attendance}%",
                              icon: Icons.event_available,
                              color: const Color(0xFF2563EB),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: MiniInfoCard(
                              title: "Marks",
                              value: "${student.marks}/100",
                              icon: Icons.menu_book,
                              color: const Color(0xFF16A34A),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      MiniInfoCard(
                        title: "Today Attendance",
                        value: student.todayAttendance,
                        icon: student.todayAttendance == "Present"
                            ? Icons.check_circle
                            : student.todayAttendance == "Absent"
                                ? Icons.cancel
                                : Icons.schedule,
                        color: student.todayAttendance == "Present"
                            ? Colors.green
                            : student.todayAttendance == "Absent"
                                ? Colors.red
                                : Colors.orange,
                      ),

                      const SizedBox(height: 10),

                      MiniInfoCard(
                        title: "AI Academic Prediction",
                        value: aiRisk,
                        icon: Icons.psychology,
                        color: aiRisk == "High Risk"
                            ? Colors.red
                            : aiRisk == "Medium Risk"
                                ? Colors.orange
                                : Colors.green,
                      ),

                      const SizedBox(height: 10),

                      SimpleTile(
                        icon: Icons.hotel,
                        title: "Hostel Room: ${student.hostel}",
                      ),

                      SimpleTile(
                        icon: Icons.directions_bus,
                        title: "Bus Route: ${student.bus}",
                      ),

                      StreamBuilder<QuerySnapshot>(
                        stream: FirestoreService.db
                            .collection('students')
                            .doc(student.id)
                            .collection('announcements')
                            .snapshots(),
                        builder: (context, annSnapshot) {
                          if (!annSnapshot.hasData ||
                              annSnapshot.data!.docs.isEmpty) {
                            return const SimpleTile(
                              icon: Icons.campaign,
                              title: "No personal announcement",
                            );
                          }

                          final lastAnnouncement =
                              annSnapshot.data!.docs.last.data()
                                  as Map<String, dynamic>;

                          return SimpleTile(
                            icon: Icons.campaign,
                            title:
                                "Announcement: ${lastAnnouncement['message'] ?? 'No message'}",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }
}