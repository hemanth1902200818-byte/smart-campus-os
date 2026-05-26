import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class AnalyticsDashboardPage extends StatelessWidget {
  const AnalyticsDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("📊 National Education Analytics"),
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
                  "Your Institution Stats",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const Text(
                          "5000+",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Total Students"),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "92%",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF16A34A)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Avg Attendance"),
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
                  "National Comparison",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.bar_chart,
                  title: "Compare Rankings",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.public,
                  title: "National Benchmarks",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Performance Metrics",
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
                  "Student Analytics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.people,
                  title: "Student Demographics",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.school,
                  title: "Course Enrollment Trends",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.assessment,
                  title: "Academic Performance Trends",
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
                  "Placement Analytics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.work,
                  title: "Placement Rate: 92%",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Average Package: 8.5 LPA",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.business,
                  title: "Top Recruiters",
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
                  "Reports & Exports",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.download,
                  title: "Export Annual Report",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.picture_as_pdf,
                  title: "Generate PDF Reports",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.share,
                  title: "Share Analytics",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
