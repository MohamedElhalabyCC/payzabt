import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // List of questions and answers
    final List<Map<String, String>> faqData = [
      {"q": "How do I create a new envelope?", "a": "Navigate to the Envelopes tab and tap the '+' button..."},
      {"q": "What happens to leftover money at the end of the month?", "a": "You can choose to roll it over to next month or move it to savings."},
      {"q": "How do I set up a financial goal?", "a": "Go to the Goals section and enter your target amount and name."},
      {"q": "Can I change my monthly budget mid-month?", "a": "Yes, go to settings and update your budget amount anytime."},
      {"q": "How does the salary day setting work?", "a": "Set the day you get paid, and your budget will reset automatically on that day."},
      {"q": "What are insights and how do they help?", "a": "Insights analyze your spending patterns to help you save more."},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFC), // Matching your light background
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF101828),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: faqData.length,
        itemBuilder: (context, index) {
          return FAQTile(
            question: faqData[index]['q']!,
            answer: faqData[index]['a']!,
          );
        },
      ),
    );
  }
}

class FAQTile extends StatelessWidget {
  final String question;
  final String answer;

  const FAQTile({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16), // Space between tiles
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // Large rounded corners from Figma
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03), // Very soft shadow
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Theme(
        // This removes the default lines that ExpansionTile adds
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          iconColor: const Color(0xFF94A3B8), // Grey arrow color
          collapsedIconColor: const Color(0xFF94A3B8),
          tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          title: Text(
            question,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155), // Dark slate text color
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Text(
                answer,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B), // Lighter grey for answer
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}