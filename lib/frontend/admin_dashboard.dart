import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_state.dart';
import '../backend/firestore_service.dart';
import '../widegets/app_widgets.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  Future<void> addStudent() async {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final usnController = TextEditingController();
    final attendanceController = TextEditingController();
    final marksController = TextEditingController();
    final hostelController = TextEditingController();
    final busController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Add New Student"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Student Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Student Email"),
                ),
                TextField(
                  controller: usnController,
                  decoration: const InputDecoration(labelText: "USN"),
                ),
                TextField(
                  controller: attendanceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Initial Attendance %"),
                ),
                TextField(
                  controller: marksController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: "Internal Marks"),
                ),
                TextField(
                  controller: hostelController,
                  decoration: const InputDecoration(labelText: "Hostel Room"),
                ),
                TextField(
                  controller: busController,
                  decoration: const InputDecoration(labelText: "Bus Route"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () async {
                final name = nameController.text.trim();
                final email = emailController.text.trim().toLowerCase();
                final usn = usnController.text.trim();

                if (name.isEmpty || email.isEmpty || usn.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Name, email and USN are required"),
                    ),
                  );
                  return;
                }

                await FirestoreService.addStudent(
                  name: name,
                  email: email,
                  usn: usn,
                  attendance: int.tryParse(attendanceController.text.trim()) ?? 0,
                  marks: int.tryParse(marksController.text.trim()) ?? 0,
                  hostel: hostelController.text.trim(),
                  bus: busController.text.trim(),
                );

                if (!mounted) return;

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("$name added successfully")),
                );
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  Future<void> deleteStudent() async {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final usnController = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("Delete Student"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Enter exact Name, Email and USN to delete.",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "Student Name"),
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: "Student Email"),
                ),
                TextField(
                  controller: usnController,
                  decoration: const InputDecoration(labelText: "USN"),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final deletedCount = await FirestoreService.deleteStudentByDetails(
                  name: nameController.text.trim(),
                  email: emailController.text.trim(),
                  usn: usnController.text.trim(),
                );

                if (!mounted) return;

                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      deletedCount == 0
                          ? "No matching student found"
                          : "Student deleted successfully",
                    ),
                  ),
                );
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  Future<void> update(String msg) async {
    await FirestoreService.addNotification(msg);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final canEdit = AppState.role == "Admin";

    return ListView(
      padding: const EdgeInsets.all(18),
      children: [
        const Text(
          "Admin Management",
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 14),

        StreamBuilder<QuerySnapshot>(
          stream: FirestoreService.allStudentsStream(),
          builder: (context, snapshot) {
            final totalStudents = snapshot.hasData ? snapshot.data!.docs.length : 0;

            return Row(
              children: [
                Expanded(
                  child: InfoCard(
                    title: "Total Students",
                    value: "$totalStudents",
                    icon: Icons.people,
                    color: const Color(0xFF2563EB),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: InfoCard(
                    title: "Faculty",
                    value: "75",
                    icon: Icons.groups,
                    color: Color(0xFF16A34A),
                  ),
                ),
              ],
            );
          },
        ),

        const InfoCard(
          title: "Hostel Blocks",
          value: "4 Blocks",
          icon: Icons.hotel,
          color: Color(0xFF9333EA),
        ),

        const InfoCard(
          title: "Transport",
          value: "12 Buses",
          icon: Icons.directions_bus,
          color: Color(0xFFF97316),
        ),

        const SizedBox(height: 16),

        ActionButton(
          text: "Add New Student",
          icon: Icons.person_add,
          enabled: canEdit,
          onTap: addStudent,
        ),

        ActionButton(
          text: "Delete Student",
          icon: Icons.delete,
          enabled: canEdit,
          onTap: deleteStudent,
        ),

        ActionButton(
          text: "Add Placement Drive",
          icon: Icons.work,
          enabled: canEdit,
          onTap: () => update("Admin added new placement drive"),
        ),

        ActionButton(
          text: "Add Campus Event",
          icon: Icons.event,
          enabled: canEdit,
          onTap: () => update("Admin added new campus event"),
        ),

        ActionButton(
          text: "Update Hostel Notice",
          icon: Icons.hotel,
          enabled: canEdit,
          onTap: () => update("Admin updated hostel notice"),
        ),

        ActionButton(
          text: "Update Transport Route",
          icon: Icons.directions_bus,
          enabled: canEdit,
          onTap: () => update("Admin updated transport route"),
        ),

        Text(
          canEdit
              ? "Admin can add and delete students using name, email and USN."
              : "Only admin login can update management data.",
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}