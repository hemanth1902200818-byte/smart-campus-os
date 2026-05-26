import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class EventsClubsPage extends StatelessWidget {
  const EventsClubsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("🎉 Events & Club Ecosystem"),
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
                  "Upcoming Events",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.event,
                  title: "Tech Summit 2024",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.event,
                  title: "Annual Sports Meet",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.event,
                  title: "Cultural Festival",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.event,
                  title: "Hackathon 2024",
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
                  "Club Memberships",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.people,
                  title: "Browse All Clubs",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.person_add,
                  title: "Join a Club",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.card_membership,
                  title: "My Memberships",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.chat,
                  title: "Club Discussions",
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
                  "Event Management",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.note_add,
                  title: "Create Event",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.card_giftcard,
                  title: "Event Registration",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.fact_check,
                  title: "Attendance Tracking",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.feedback,
                  title: "Event Feedback",
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
                  "Announcements",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.notifications_active,
                  title: "Latest News",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.calendar_today,
                  title: "Calendar View",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.bookmark,
                  title: "Saved Events",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
