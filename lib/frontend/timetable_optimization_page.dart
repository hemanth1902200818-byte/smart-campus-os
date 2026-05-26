import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class TimetableOptimizationPage extends StatelessWidget {
  const TimetableOptimizationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("📅 Dynamic Timetable Optimization"),
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
                  "Today's Schedule",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.schedule,
                  title: "09:00 - 10:30 Flutter Development",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.schedule,
                  title: "10:45 - 12:15 Cloud Computing",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.schedule,
                  title: "13:00 - 14:30 Database Management",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.schedule,
                  title: "14:45 - 16:15 Lab Sessions",
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
                  "AI Optimized Schedule",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.smart_toy,
                  title: "View Optimized Timetable",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.compare_arrows,
                  title: "Compare with Current",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.check_circle,
                  title: "Apply Optimization",
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
                  "Weekly View",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.calendar_view_week,
                  title: "Monday - 5 Classes",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.calendar_view_week,
                  title: "Tuesday - 4 Classes",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.calendar_view_week,
                  title: "Wednesday - 5 Classes",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.calendar_view_week,
                  title: "Thursday - 4 Classes",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.calendar_view_week,
                  title: "Friday - 3 Classes",
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
                  "Optimization Metrics",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Free Time: +2 Hours",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Travel Reduction: 30%",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Study Efficiency: 25% Increase",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
