import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class PlacementPortalPage extends StatelessWidget {
  const PlacementPortalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("💼 Placement Portal"),
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
                          "48",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Placements"),
                      ],
                    ),
                    Column(
                      children: [
                        const Text(
                          "92%",
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF16A34A)),
                        ),
                        const SizedBox(height: 4),
                        const Text("Success Rate"),
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
                  "Job Opportunities",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.work,
                  title: "Browse Job Postings",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.send,
                  title: "Submit Applications",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.bookmark,
                  title: "Saved Jobs",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.analytics,
                  title: "Job Analytics",
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
                  "Interview Preparation",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.video_call,
                  title: "Mock Interviews",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.school,
                  title: "Placement Training",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.description,
                  title: "Resume Builder",
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
                  "Application Status",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.pending_actions,
                  title: "Pending Applications",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.done_all,
                  title: "Interview Scheduled",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.check_circle,
                  title: "Offers Received",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
