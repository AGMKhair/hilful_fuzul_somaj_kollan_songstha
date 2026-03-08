import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220.h,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: const [Shadow(blurRadius: 10, color: Colors.black45)],
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Color(0xFF11539D), Color(0xFF398200)],
                      ),
                    ),
                  ),
                  // Background Pattern/Logo Opacity
                  Center(
                    child: Opacity(
                      opacity: 0.1,
                      child: Icon(Icons.handshake, size: 150.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Tagline
                  Center(
                    child: Text(
                      'মানবতার কল্যাণে আমাদের পথচলা',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // Quick Actions Grid
                  _buildQuickActions(context),
                  SizedBox(height: 30.h),

                  // Impact Counters
                  _buildImpactSection(context),
                  SizedBox(height: 30.h),

                  // This Month Highlights
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('চলতি মাসের হাইলাইটস', style: theme.textTheme.titleLarge),
                      TextButton(
                        onPressed: () => context.go('/routine'),
                        child: const Text('সব দেখুন'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  _buildHighlightsList(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: [
        _actionItem(context, Icons.lightbulb, 'লক্ষ্য', () => _showGoals(context)),
        _actionItem(context, Icons.event_note, 'রুটিন', () => context.go('/routine')),
        _actionItem(context, Icons.volunteer_activism, 'সহযোগিতা', () => context.go('/support')),
        _actionItem(context, Icons.contact_phone, 'যোগাযোগ', () {}),
      ],
    );
  }

  void _showGoals(BuildContext context) {
    // Navigate to goals or show dialog
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const FractionallySizedBox(
        heightFactor: 0.8,
        child: GoalsDialog(),
      ),
    );
  }

  Widget _actionItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 24.sp),
          ),
          SizedBox(height: 4.h),
          Text(label, style: TextStyle(fontSize: 11.sp, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildImpactSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: const Color(0xFF398200).withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Text('আমাদের অর্জন', style: Theme.of(context).textTheme.titleMedium),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _impactCounter('৫০০+', 'সাহায্যপ্রাপ্ত'),
              _impactCounter('২০+', 'ক্যাম্প'),
              _impactCounter('১০০+', 'স্বেচ্ছাসেবক'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _impactCounter(String count, String label) {
    return Column(
      children: [
        Text(count, style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: const Color(0xFF398200))),
        Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildHighlightsList() {
    return SizedBox(
      height: 160.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 280.w,
            margin: EdgeInsets.only(right: 12.w),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.vertical(top: Radius.circular(12.r)),
                    ),
                    child: Center(child: Icon(Icons.image, color: Colors.grey[400])),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('চলতি প্রজেক্ট ${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        Text('স্থান: ঢাকা, বাংলাদেশ', style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GoalsDialog extends StatelessWidget {
  const GoalsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          AppBar(
            title: const Text('লক্ষ্য ও উদ্দেশ্য'),
            automaticallyImplyLeading: false,
            actions: [IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close))],
            bottom: const TabBar(
              tabs: [
                Tab(text: 'লক্ষ্য'),
                Tab(text: 'উদ্দেশ্য'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _buildGoalList([
                  'অসহায় মানুষের মৌলিক অধিকার নিশ্চিত করা।',
                  'দারিদ্র্য বিমোচনে কার্যকর ভূমিকা রাখা।',
                  'সুস্থ ও শিক্ষিত সমাজ গড়ে তোলা।',
                ]),
                _buildGoalList([
                  'বিনামূল্যে চিকিৎসা সেবা প্রদান।',
                  'অনাথ ও পথশিশুদের শিক্ষা নিশ্চিত করা।',
                  'রমজান ও ঈদে খাদ্য বিতরণ।',
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalList(List<String> items) {
    return ListView.builder(
      padding: EdgeInsets.all(16.w),
      itemCount: items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.check_circle, color: Theme.of(context).primaryColor),
        title: Text(items[index]),
      ),
    );
  }
}
