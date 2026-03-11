import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('লক্ষ্য ও উদ্দেশ্য'),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: ColorUtil.logoGradient,
            ),
          ),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.65),
            labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
            unselectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BoxDecoration(
              color: Colors.white.withOpacity(0.22), // active tab background
              borderRadius: BorderRadius.circular(0.r),
            ),
            tabs: const [
              Tab(text: 'লক্ষ্য'),
              Tab(text: 'উদ্দেশ্য'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildList(context, const [
              'অসহায় মানুষের মৌলিক অধিকার নিশ্চিত করা।',
              'দারিদ্র্য বিমোচনে কার্যকর ভূমিকা রাখা।',
              'সুস্থ ও শিক্ষিত সমাজ গড়ে তোলা।',
            ]),
            _buildList(context, const [
              'বিনামূল্যে চিকিৎসা সেবা প্রদান।',
              'অনাথ ও পথশিশুদের শিক্ষা নিশ্চিত করা।',
              'রমজান ও ঈদে খাদ্য বিতরণ।',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context, List<String> items) {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: items.length,
      separatorBuilder: (_, __) => SizedBox(height: 10.h),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(14.w),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.06),
            borderRadius: BorderRadius.circular(14.r),
            border: Border.all(color: Theme.of(context).primaryColor.withOpacity(0.15)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  items[index],
                  style: TextStyle(fontSize: 14.sp, height: 1.35),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}