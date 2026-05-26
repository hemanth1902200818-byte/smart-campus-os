import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart';

class HostelTransportPage extends StatelessWidget {
  const HostelTransportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const SectionTitle("🏨 Hostel & Transport Management"),
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
                  "Hostel Services",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.bed,
                  title: "Room Allocation",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.build,
                  title: "Maintenance Requests",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.checklist,
                  title: "Room Inspection Schedule",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.menu_book,
                  title: "Mess Menu & Billing",
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
                  "Transport Management",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.directions_bus,
                  title: "Bus Routes & Schedule",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.location_on,
                  title: "Live Bus Tracking",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.card_travel,
                  title: "Travel Pass",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.receipt,
                  title: "Transport Fee Payment",
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
                  "Complaints & Support",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                SimpleTile(
                  icon: Icons.report_problem,
                  title: "File Complaint",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.track_changes,
                  title: "Track Complaint Status",
                ),
                const SizedBox(height: 8),
                SimpleTile(
                  icon: Icons.support_agent,
                  title: "Contact Support",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
