import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class AcademicManagementPage extends StatelessWidget {
  const AcademicManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("📚 Academic Management"),
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
                  "Course Enrollment",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.school,
                  title: "View Available Courses",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.check_circle,
                  title: "Enroll in Courses",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.book,
                  title: "Course Materials",
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
                  "Grades & Assessments",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.grade,
                  title: "View Grades",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.assignment,
                  title: "Assignments",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.assessment,
                  title: "Exam Schedule",
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
                  "Academic Performance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "GPA Tracker",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.bar_chart,
                  title: "Performance Analytics",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.timeline,
                  title: "Academic History",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
