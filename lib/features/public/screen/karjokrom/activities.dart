import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class ActivitiesScreen extends StatelessWidget {
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমাদের কার্যক্রম'),
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
        itemCount: 6,
        itemBuilder: (context, index) {
          final categories = [
            {'name': 'খাদ্য বিতরণ', 'icon': Icons.restaurant},
            {'name': 'চিকিৎসা সহায়তা', 'icon': Icons.medical_services},
            {'name': 'শিক্ষা সহায়তা', 'icon': Icons.school},
            {'name': 'জরুরি ত্রাণ', 'icon': Icons.emergency},
            {'name': 'আইনি সহায়তা', 'icon': Icons.gavel},
            {'name': 'পুনর্বাসন', 'icon': Icons.home_repair_service},
          ];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(categories[index]['icon'] as IconData, color: Theme.of(context).primaryColor),
              ),
              title: Text(categories[index]['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('সংক্ষিপ্ত বিবরণ এখানে থাকবে...'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
