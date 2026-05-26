import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class AIPerformancePredictionPage extends StatelessWidget {
  const AIPerformancePredictionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("🤖 AI Performance Prediction"),
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
                  "Predicted Academic Performance",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2563EB).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Predicted GPA: 3.85"),
                      const SizedBox(height: 8),
                      const Text("Confidence: 92%"),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: 0.92,
                          minHeight: 8,
                          backgroundColor: Colors.grey[300],
                          valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2563EB)),
                        ),
                      ),
                    ],
                  ),
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
                  "Course-wise Predictions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Flutter Development - A (Predicted)",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Cloud Computing - B+ (Predicted)",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.trending_up,
                  title: "Database Management - A- (Predicted)",
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
                  "AI Recommendations",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.lightbulb,
                  title: "Focus on Database concepts",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.lightbulb,
                  title: "Attend extra tutorials",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.lightbulb,
                  title: "Form study groups",
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
                  "Risk Analysis",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.warning,
                  title: "Low Risk Courses",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.info,
                  title: "Medium Risk Areas",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.support_agent,
                  title: "Get Help Now",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
