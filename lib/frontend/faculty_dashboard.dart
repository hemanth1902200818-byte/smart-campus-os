import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_state.dart';
import '../backend/firestore_service.dart';
import '../models/student_model.dart';
import '../widegets/app_widgets.dart';

class FacultyDashboard extends StatelessWidget {
  const FacultyDashboard({super.key});

  Future<void> updateMarks(
    BuildContext context,
    String studentId,
    String studentName,
  ) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Upload Marks for $studentName"),
          content: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Enter marks out of 100",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final marks = int.tryParse(controller.text.trim());

                if (marks == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid marks")),
                  );
                  return;
                }

                await FirestoreService.updateMarks(
                  studentId: studentId,
                  studentName: studentName,
                  marks: marks,
                );

                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Marks updated for $studentName")),
                  );
                }
              },
              child: const Text("Save"),
            ),
          ],
        );
      },
    );
  }

  Future<void> sendAnnouncement(
    BuildContext context,
    String studentId,
    String studentName,
  ) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text("Send Announcement to $studentName"),
          content: TextField(
            controller: controller,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: "Example: Submit assignment tomorrow",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final msg = controller.text.trim();

                if (msg.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter announcement")),
                  );
                  return;
                }

                await FirestoreService.sendStudentAnnouncement(
                  studentId: studentId,
                  studentName: studentName,
                  message: msg,
                );

                if (context.mounted) {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Announcement sent to $studentName")),
                  );
                }
              },
              child: const Text("Send"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final canEdit = AppState.role == "Faculty";

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          "Faculty Dashboard",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 14),

        const InfoCard(
          title: "Attendance Dashboard",
          value: "Mark each student Present / Absent",
          icon: Icons.fact_check,
          color: Color(0xFF2563EB),
        ),

        const SizedBox(height: 10),

        const SectionTitle("Attendance Dashboard"),

        const SizedBox(height: 8),

        StreamBuilder<QuerySnapshot>(
          stream: FirestoreService.allStudentsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const SimpleTile(
                icon: Icons.error,
                title: "Firebase error while loading students",
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const SimpleTile(
                icon: Icons.warning,
                title: "No students found in database",
              );
            }

            final docs = snapshot.data!.docs;

            return Column(
              children: docs.map((doc) {
                final student = StudentModel.fromMap(
                  doc.id,
                  doc.data() as Map<String, dynamic>,
                );

                return Card(
                  margin: const EdgeInsets.only(bottom: 14),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${student.name} - ${student.usn}",
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          "Attendance: ${student.attendance}% | Today: ${student.todayAttendance}",
                          style: const TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 12),

                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: canEdit
                                    ? () async {
                                        await FirestoreService.markAttendance(
                                          studentId: student.id,
                                          studentName: student.name,
                                          isPresent: true,
                                        );

                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "${student.name} marked Present",
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    : null,
                                icon: const Icon(Icons.check_circle, size: 22),
                                label: const Text(
                                  "Present",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 42),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 8),

                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: canEdit
                                    ? () async {
                                        await FirestoreService.markAttendance(
                                          studentId: student.id,
                                          studentName: student.name,
                                          isPresent: false,
                                        );

                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                "${student.name} marked Absent",
                                              ),
                                            ),
                                          );
                                        }
                                      }
                                    : null,
                                icon: const Icon(Icons.cancel, size: 22),
                                label: const Text(
                                  "Absent",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(double.infinity, 42),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 10),

                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: canEdit
                                    ? () => updateMarks(
                                          context,
                                          student.id,
                                          student.name,
                                        )
                                    : null,
                                icon: const Icon(Icons.upload),
                                label: const Text("Marks"),
                              ),
                            ),

                            const SizedBox(width: 10),

                            Expanded(
                              child: OutlinedButton.icon(
                                onPressed: canEdit
                                    ? () => sendAnnouncement(
                                          context,
                                          student.id,
                                          student.name,
                                        )
                                    : null,
                                icon: const Icon(Icons.campaign),
                                label: const Text("Announcement"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),

        Text(
          canEdit
              ? "Faculty can mark attendance, upload marks, and send announcements student-wise."
              : "Only faculty login can update attendance.",
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}