import 'package:flutter/material.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের রুটিন'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'চলতি মাস'),
                Tab(text: 'স্থায়ী রুটিন'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildMonthlyRoutine(),
                  _buildRecurringRoutine(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthlyRoutine() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Column(
                  children: [
                    const Text('সেপ্টেম্বর', style: TextStyle(fontSize: 12)),
                    Text('${index + 5}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                const VerticalDivider(),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('ফ্রি মেডিকেল ক্যাম্প', style: TextStyle(fontWeight: FontWeight.bold)),
                      const Text('স্থান: উত্তরপাড়া প্রাইমারি স্কুল', style: TextStyle(fontSize: 12)),
                      const SizedBox(height: 5),
                      Chip(
                        label: const Text('চলছে', style: TextStyle(fontSize: 10, color: Colors.white)),
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecurringRoutine() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _recurringItem('খাদ্য বিতরণ', 'প্রতি মাসের ১ম শুক্রবার'),
        _recurringItem('সচেতনতা সভা', 'প্রতি মাসের ১৫ তারিখ'),
        _recurringItem('কেস ভিজিট', 'প্রতি বুধবার'),
        _recurringItem('মাসিক মিটিং', 'মাসের শেষ দিন'),
      ],
    );
  }

  Widget _recurringItem(String title, String timing) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.repeat, color: Color(0xFF398200)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(timing),
      ),
    );
  }
}
