import 'package:flutter/material.dart';

class AIAssistantPage extends StatefulWidget {
  const AIAssistantPage({super.key});

  @override
  State<AIAssistantPage> createState() => _AIAssistantPageState();
}

class _AIAssistantPageState extends State<AIAssistantPage> {
  final TextEditingController controller = TextEditingController();

  List<Map<String, String>> chats = [
    {
      "bot":
          "Hi! I am your AI Campus Assistant. Ask about attendance, hostel, transport, placement or events."
    }
  ];

  String answer(String q) {
    q = q.toLowerCase();

    if (q.contains("attendance")) {
      return "Faculty can professionally mark each student as Present or Absent. Student attendance updates live.";
    }

    if (q.contains("hostel")) {
      return "Hostel details are available in the Student Dashboard and Modules section.";
    }

    if (q.contains("bus") || q.contains("transport")) {
      return "Transport details are available in Student Dashboard and Modules.";
    }

    if (q.contains("placement") || q.contains("company")) {
      return "Placement drives are shown in the Placement Portal.";
    }

    if (q.contains("event")) {
      return "Upcoming events: AI Hackathon, Placement Training, and Cultural Fest Registration.";
    }

    if (q.contains("risk") || q.contains("ai")) {
      return "AI risk is calculated based on each student's attendance and marks.";
    }

    return "I can help with attendance, hostel, transport, placements, events and AI academic risk.";
  }

  void send() {
    if (controller.text.trim().isEmpty) return;

    String q = controller.text.trim();
    String botReply = answer(q);

    setState(() {
      chats.add({"user": q});
      chats.add({"bot": botReply});
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(18),
          child: Text(
            "AI Campus Assistant",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
        ),

        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(14),
            children: chats.map((chat) {
              final bool isUser = chat.containsKey("user");

              return Align(
                alignment:
                    isUser ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.all(14),
                  constraints: const BoxConstraints(maxWidth: 300),
                  decoration: BoxDecoration(
                    color: isUser ? const Color(0xFF2563EB) : Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Text(
                    isUser ? chat["user"]! : chat["bot"]!,
                    style: TextStyle(
                      color: isUser ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: "Ask AI assistant...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              ElevatedButton(
                onPressed: send,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
                child: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ],
    );
  }
}