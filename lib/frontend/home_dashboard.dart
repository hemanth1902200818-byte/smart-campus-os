import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../backend/firestore_service.dart';
import '../widegets/app_widgets.dart';

class HomeDashboard extends StatelessWidget {
  const HomeDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        // Welcome Header
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2563EB), Color(0xFF1E40AF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Welcome to Smart Campus OS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Unified Platform for All Campus Operations",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),

        // Quick Stats
        const Text(
          "📊 Campus Overview",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        Row(
          children: const [
            Expanded(
              child: InfoCard(
                title: "Students",
                value: "5000+",
                icon: Icons.people,
                color: Color(0xFF2563EB),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: InfoCard(
                title: "Attendance",
                value: "92%",
                icon: Icons.check_circle,
                color: Color(0xFF16A34A),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: const [
            Expanded(
              child: InfoCard(
                title: "Placements",
                value: "92%",
                icon: Icons.work,
                color: Color(0xFFF97316),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: InfoCard(
                title: "AI Features",
                value: "Active",
                icon: Icons.smart_toy,
                color: Color(0xFF9333EA),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Core Features Section
        const Text(
          "🎯 Core Features",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _FeatureCard(
              icon: Icons.book,
              title: "Academic\nManagement",
              color: const Color(0xFF2563EB),
            ),
            _FeatureCard(
              icon: Icons.fact_check,
              title: "Attendance\nAutomation",
              color: const Color(0xFF16A34A),
            ),
            _FeatureCard(
              icon: Icons.hotel,
              title: "Hostel &\nTransport",
              color: const Color(0xFFF97316),
            ),
            _FeatureCard(
              icon: Icons.work,
              title: "Placement\nPortal",
              color: const Color(0xFF9333EA),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Advanced Features Section
        const Text(
          "🚀 Advanced Features",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 12),

        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            _FeatureCard(
              icon: Icons.event,
              title: "Events &\nClubs",
              color: const Color(0xFFEC4899),
            ),
            _FeatureCard(
              icon: Icons.trending_up,
              title: "AI Performance\nPrediction",
              color: const Color(0xFF06B6D4),
            ),
            _FeatureCard(
              icon: Icons.schedule,
              title: "Dynamic\nTimetable",
              color: const Color(0xFF8B5CF6),
            ),
            _FeatureCard(
              icon: Icons.bar_chart,
              title: "Analytics &\nInsights",
              color: const Color(0xFF14B8A6),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Latest Notifications
        const SectionTitle("📬 Latest Notifications"),

        StreamBuilder<QuerySnapshot>(
          stream: FirestoreService.notificationsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.hasError) {
              return const SimpleTile(
                icon: Icons.error,
                title: "Firebase error",
              );
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const SimpleTile(
                icon: Icons.notifications,
                title: "No notifications found",
              );
            }

            final docs = snapshot.data!.docs;

            return Column(
              children: docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                final message = data['message'] ?? "No message";

                return SimpleTile(
                  icon: Icons.notifications,
                  title: message,
                );
              }).toList(),
            );
          },
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}