import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('কাজের রুটিন'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: ColorUtil.logoBlue,
              unselectedLabelColor: Colors.grey,
              indicatorColor: ColorUtil.logoBlue,
              labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              tabs: const [
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
    // হোম স্ক্রিনের চলমান প্রজেক্ট ডাটা
    final projects = [
      {
        'name': 'কুরআন প্রতিযোগিতা অনুষ্ঠান',
        'status': 'চলমান',
        'date': 'রমজান মাস',
      },
      {
        'name': 'ইফতার বিতরণ (১৩৯ পরিবার)',
        'status': 'সম্পন্ন',
        'date': '১০-২০ রমজান',
      },
      {
        'name': 'কুরআন শিক্ষা কার্যক্রম',
        'status': 'চলমান',
        'date': 'প্রতিদিন',
      },
      {
        'name': 'ইফতার মাহফিল/অনুষ্ঠান',
        'status': 'আসন্ন',
        'date': '২৩শে রমজান',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: projects.length,
      itemBuilder: (context, index) {
        final p = projects[index];
        return Card(
          margin: EdgeInsets.only(bottom: 12.h),
          child: ListTile(
            leading: Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                color: ColorUtil.logoBlue.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.event_available, color: ColorUtil.logoBlue, size: 24.sp),
            ),
            title: Text(p['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('সময়: ${p['date']}'),
            trailing: Chip(
              label: Text(
                p['status']!,
                style: TextStyle(color: Colors.white, fontSize: 10.sp),
              ),
              backgroundColor: p['status'] == 'চলমান' 
                  ? Colors.blue 
                  : (p['status'] == 'সম্পন্ন' ? ColorUtil.logoGreen : Colors.orange),
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
    );
  }

  Widget _buildRecurringRoutine() {
    return ListView(
      padding: EdgeInsets.all(16.w),
      children: [
        _recurringItem('এতিমদের শিক্ষা খাতে ব্যয়', 'প্রতি মাসের নির্দিষ্ট তারিখে'),
        _recurringItem('খাদ্য বিতরণ', 'প্রতি মাসের ১ম শুক্রবার'),
        _recurringItem('সচেতনতা সভা', 'প্রতি মাসের ১৫ তারিখ'),
        _recurringItem('কেস ভিজিট', 'প্রতি বুধবার'),
        _recurringItem('মাসিক মিটিং', 'মাসের শেষ দিন'),
      ],
    );
  }

  Widget _recurringItem(String title, String timing) {
    return Card(
      margin: EdgeInsets.only(bottom: 12.h),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: ColorUtil.logoGreen.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.repeat, color: ColorUtil.logoGreen, size: 20.sp),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(timing),
      ),
    );
  }
}
