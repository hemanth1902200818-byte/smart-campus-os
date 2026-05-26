import 'package:flutter/material.dart';

import '../app_state.dart';
import 'login_page.dart';
import 'home_dashboard.dart';
import 'student_dashboard.dart';
import 'faculty_dashboard.dart';
import 'admin_dashboard.dart';
import 'modules_page.dart';
import 'ai_assistant_page.dart';
import 'academic_management_page.dart';
import 'attendance_management_page.dart';
import 'hostel_transport_page.dart';
import 'placement_portal_page.dart';
import 'events_clubs_page.dart';
import 'ai_performance_prediction_page.dart';
import 'timetable_optimization_page.dart';
import 'analytics_dashboard_page.dart';

class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int index = 0;

  final pages = const [
    HomeDashboard(),
    StudentDashboard(),
    FacultyDashboard(),
    AdminDashboard(),
    AcademicManagementPage(),
    AttendanceManagementPage(),
    HostelTransportPage(),
    PlacementPortalPage(),
    EventsClubsPage(),
    AIPerformancePredictionPage(),
    TimetableOptimizationPage(),
    AnalyticsDashboardPage(),
    ModulesPage(),
    AIAssistantPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Smart Campus OS - ${AppState.role}"),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF1E293B),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: pages[index],
      bottomNavigationBar: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
          },
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: "Home"),
            NavigationDestination(icon: Icon(Icons.person), label: "Student"),
            NavigationDestination(icon: Icon(Icons.groups), label: "Faculty"),
            NavigationDestination(icon: Icon(Icons.admin_panel_settings), label: "Admin"),
            NavigationDestination(icon: Icon(Icons.book), label: "Academics"),
            NavigationDestination(icon: Icon(Icons.fact_check), label: "Attendance"),
            NavigationDestination(icon: Icon(Icons.hotel), label: "Hostel"),
            NavigationDestination(icon: Icon(Icons.work), label: "Placement"),
            NavigationDestination(icon: Icon(Icons.event), label: "Events"),
            NavigationDestination(icon: Icon(Icons.trending_up), label: "Prediction"),
            NavigationDestination(icon: Icon(Icons.schedule), label: "Timetable"),
            NavigationDestination(icon: Icon(Icons.bar_chart), label: "Analytics"),
            NavigationDestination(icon: Icon(Icons.apps), label: "Modules"),
            NavigationDestination(icon: Icon(Icons.smart_toy), label: "AI Bot"),
          ],
        ),
      ),
    );
  }
}