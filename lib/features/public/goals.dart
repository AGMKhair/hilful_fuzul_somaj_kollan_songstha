import 'package:flutter/material.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('লক্ষ্য ও উদ্দেশ্য'),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: 'লক্ষ্য (Goals)'),
                Tab(text: 'উদ্দেশ্য (Objectives)'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildList([
                    'অসহায় মানুষের মৌলিক অধিকার নিশ্চিত করা।',
                    'দারিদ্র্য বিমোচনে কার্যকর ভূমিকা রাখা।',
                    'সুস্থ ও শিক্ষিত সমাজ গড়ে তোলা।',
                    'সামাজিক বৈষম্য দূর করা।',
                  ]),
                  _buildList([
                    'বিনামূল্যে চিকিৎসা সেবা প্রদান।',
                    'অনাথ ও পথশিশুদের শিক্ষা নিশ্চিত করা।',
                    'রমজান ও ঈদে খাদ্য বিতরণ।',
                    'প্রাকৃতিক দুর্যোগে জরুরি ত্রাণ সহায়তা।',
                    'বেকার যুবকদের কর্মসংস্থান সৃষ্টিতে সহায়তা।',
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<String> items) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: const Color(0xFF398200),
              child: Text('${index + 1}', style: const TextStyle(color: Colors.white)),
            ),
            title: Text(items[index]),
          ),
        );
      },
    );
  }
}
