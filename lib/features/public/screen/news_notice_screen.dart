import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class NewsNoticeScreen extends StatelessWidget {
  const NewsNoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সংবাদ ও নোটিশ'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: const Icon(Icons.campaign, color: ColorUtil.logoBlue),
              title: Text('সংবাদ/নোটিশ ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('এখানে সংবাদের বিস্তারিত সংক্ষিপ্ত আকারে থাকবে...'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 14),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
