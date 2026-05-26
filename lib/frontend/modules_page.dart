import 'package:flutter/material.dart';

import '../widegets/app_widgets.dart' show SectionTitle, SimpleTile;

class ModulesPage extends StatelessWidget {
  const ModulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(18),
      children: const [
        Text(
          "Unified Smart Campus Operating System",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: 8),

        Text(
          "A unified AI-powered campus platform capable of managing academics, attendance, hostel, transport, placements, events, clubs and administration at scale.",
          style: TextStyle(color: Colors.grey, fontSize: 15),
        ),

        SizedBox(height: 20),

        SectionTitle("Core Features"),

        SimpleTile(
          icon: Icons.school,
          title: "Academic Management - Student records, internal marks, academic performance and dashboard management.",
        ),

        SimpleTile(
          icon: Icons.fact_check,
          title: "Attendance Automation - Faculty can mark each student Present or Absent and attendance updates live in Firestore.",
        ),

        SimpleTile(
          icon: Icons.hotel,
          title: "Hostel Management - Hostel room details, blocks, availability and hostel notice updates.",
        ),

        SimpleTile(
          icon: Icons.directions_bus,
          title: "Transport Management - Bus route details, transport status, route updates and delay notifications.",
        ),

        SimpleTile(
          icon: Icons.work,
          title: "Placement Portal - Placement drive updates, company details, eligibility and student placement information.",
        ),

        SimpleTile(
          icon: Icons.event,
          title: "Event & Club Ecosystem - Campus events, club activities, hackathons and student participation updates.",
        ),

        SizedBox(height: 20),

        SectionTitle("Advanced Features"),

        SimpleTile(
          icon: Icons.psychology,
          title: "AI Academic Performance Prediction - Student risk is predicted using attendance and internal marks.",
        ),

        SimpleTile(
          icon: Icons.schedule,
          title: "Dynamic Timetable Optimization - Smart timetable module can help optimize class schedules, subject allocation and faculty workload.",
        ),

        SimpleTile(
          icon: Icons.account_tree,
          title: "Multi-Campus Interoperability - System is designed to support multiple campuses, departments and branches under one platform.",
        ),

        SimpleTile(
          icon: Icons.smart_toy,
          title: "AI-Powered Administrative Assistant - AI bot helps users with attendance, hostel, transport, placements, events and campus information.",
        ),

        SimpleTile(
          icon: Icons.analytics,
          title: "National Education Analytics Dashboard - Analytics module can show institution-level and multi-campus performance insights.",
        ),

        SizedBox(height: 20),

        SectionTitle("Role-Based Dashboards"),

        SimpleTile(
          icon: Icons.person,
          title: "Student Dashboard - Students login using email and see only their own attendance, marks, hostel, bus and announcements.",
        ),

        SimpleTile(
          icon: Icons.groups,
          title: "Faculty Dashboard - Faculty can mark attendance, upload marks and send student-wise announcements.",
        ),

        SimpleTile(
          icon: Icons.admin_panel_settings,
          title: "Admin Dashboard - Admin can add students, delete students and update campus-level data.",
        ),

        SizedBox(height: 20),

        SectionTitle("Database & Backend"),

        SimpleTile(
          icon: Icons.cloud,
          title: "Firebase Backend - Firebase handles backend services, real-time communication and database operations.",
        ),

        SimpleTile(
          icon: Icons.storage,
          title: "Cloud Firestore Database - Stores students, attendance, marks, announcements and notifications.",
        ),

        SimpleTile(
          icon: Icons.notifications,
          title: "Live Notifications - Faculty and admin updates are stored as notifications and displayed on the Home Dashboard.",
        ),

        SimpleTile(
          icon: Icons.security,
          title: "Security & Privacy - Student data is separated by email login. Each student can view only their own details.",
        ),

        SizedBox(height: 20),

        SectionTitle("Suggested Tech Stack Used"),

        SimpleTile(
          icon: Icons.phone_android,
          title: "Frontend - Flutter Web / Android App",
        ),

        SimpleTile(
          icon: Icons.cloud_done,
          title: "Backend - Firebase Core and Firestore Service Layer",
        ),

        SimpleTile(
          icon: Icons.dataset,
          title: "Database - Cloud Firestore",
        ),

        SimpleTile(
          icon: Icons.design_services,
          title: "UI Design - Material UI style with light theme dashboard layout",
        ),

        SimpleTile(
          icon: Icons.sync,
          title: "Realtime Updates - Firebase real-time streams instead of Socket.io",
        ),

        SizedBox(height: 20),

        SectionTitle("Judging Considerations Covered"),

        SimpleTile(
          icon: Icons.scale,
          title: "Scalability - Firestore collection-based database design supports adding more students, departments and campuses.",
        ),

        SimpleTile(
          icon: Icons.integration_instructions,
          title: "Integration Capability - Academics, attendance, hostel, transport, placement, event and admin modules are integrated into one app.",
        ),

        SimpleTile(
          icon: Icons.psychology_alt,
          title: "Effectiveness of AI Features - AI risk prediction and AI assistant demonstrate AI-powered academic and administrative support.",
        ),

        SimpleTile(
          icon: Icons.dashboard,
          title: "Usability of Dashboards - Separate dashboards are created for students, faculty and administrators.",
        ),

        SimpleTile(
          icon: Icons.speed,
          title: "Efficiency of Automation - Attendance, marks, announcements and notifications are automated through Firebase.",
        ),

        SimpleTile(
          icon: Icons.architecture,
          title: "System Architecture - Code is separated into frontend, backend service, models, widgets and Firebase database.",
        ),

        SimpleTile(
          icon: Icons.privacy_tip,
          title: "Privacy of Student Data - Student dashboard filters records using login email so one student cannot view another student’s data.",
        ),

        SimpleTile(
          icon: Icons.verified,
          title: "Practical Feasibility - The app is running in Chrome with real Firebase database connection and live updates.",
        ),

        SizedBox(height: 20),

        SectionTitle("System Architecture"),

        SimpleTile(
          icon: Icons.web,
          title: "Frontend Layer - lib/frontend contains UI screens like Login, Home, Student, Faculty, Admin, Modules and AI Assistant.",
        ),

        SimpleTile(
          icon: Icons.settings,
          title: "Backend Layer - lib/backend/firestore_service.dart contains database logic and Firebase operations.",
        ),

        SimpleTile(
          icon: Icons.data_object,
          title: "Model Layer - lib/models/student_model.dart defines student data structure.",
        ),

        SimpleTile(
          icon: Icons.widgets,
          title: "Reusable Components - lib/widgets/app_widgets.dart contains reusable UI cards, tiles, buttons and section titles.",
        ),

        SimpleTile(
          icon: Icons.cloud_queue,
          title: "Database Layer - Firebase Firestore stores all student and campus data.",
        ),

        SizedBox(height: 20),

        SectionTitle("Future Scope"),

        SimpleTile(
          icon: Icons.lock,
          title: "Firebase Authentication can be added for secure login.",
        ),

        SimpleTile(
          icon: Icons.auto_graph,
          title: "Advanced ML model can be added for stronger academic performance prediction.",
        ),

        SimpleTile(
          icon: Icons.calendar_month,
          title: "Dynamic timetable optimization can be upgraded with automatic timetable generation.",
        ),

        SimpleTile(
          icon: Icons.public,
          title: "Multi-campus analytics can be expanded for national-level education dashboards.",
        ),

        SizedBox(height: 30),
      ],
    );
  }
}