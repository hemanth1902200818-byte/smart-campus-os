import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class AttendanceManagementPage extends StatelessWidget {
  const AttendanceManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("📋 Attendance Management"),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "85%",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF16A34A)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Overall Attendance"),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "12",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFFF97316)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Classes Missed"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Daily Check-in",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.check_circle_outline,
                  title: "Mark Present",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.fingerprint,
                  title: "Biometric Attendance",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.history,
                  title: "Attendance History",
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Course-wise Attendance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.school,
                  title: "Flutter Development - 92%",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.school,
                  title: "Cloud Computing - 78%",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.school,
                  title: "Database Management - 88%",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
