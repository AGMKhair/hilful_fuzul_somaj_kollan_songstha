import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/model/project_hiligts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Demo highlights (আপনি পরে Firestore থেকে আনবেন)
    final highlights = <ProjectHighlight>[
      ProjectHighlight(
        id: 'p1',
        name: 'চলতি প্রজেক্ট ১',
        address: 'ঢাকা, বাংলাদেশ',
        details:
        'এই প্রজেক্টের মাধ্যমে অসহায় মানুষের পাশে দাঁড়ানো, জরুরি সহায়তা এবং প্রয়োজনীয় সাপোর্ট প্রদান করা হয়।',
        imageUrl: null, // image না থাকলে logo দেখাবে
      ),
      ProjectHighlight(
        id: 'p2',
        name: 'চলতি প্রজেক্ট ২',
        address: 'চট্টগ্রাম, বাংলাদেশ',
        details:
        'শিক্ষা সহায়তা, সচেতনতা কর্মসূচি এবং কমিউনিটি সাপোর্টের মাধ্যমে এই কার্যক্রম পরিচালিত হয়।',
        imageUrl: null,
      ),
      ProjectHighlight(
        id: 'p3',
        name: 'চলতি প্রজেক্ট ৩',
        address: 'রাজশাহী, বাংলাদেশ',
        details:
        'স্বাস্থ্য ও চিকিৎসা সহায়তার অংশ হিসেবে মেডিকেল সাপোর্ট, প্রয়োজনীয় রেফারেল এবং তথ্য সহায়তা প্রদান করা হয়।',
        imageUrl: null,
      ),
    ];

    return  Scaffold(
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
                          colors: [ColorUtil.logoBlue, ColorUtil.logoGreen],
                        ),
                      ),
                    ),
                    Center(
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Image.asset(
                            'assets/images/logo.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.handshake, size: 40, color: ColorUtil.logoBlue),
                          ),
                        ),
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

                    _buildQuickActions(context),

                    SizedBox(height: 30.h),
                    _buildImpactSection(context),

                    SizedBox(height: 30.h),
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

                    _buildHighlightsList(
                      context: context,
                      items: highlights,
                    ),

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
        _actionItem(
          context,
          Icons.lightbulb,
          'লক্ষ্য',
              () => context.go('/goals'),
        ),
        _actionItem(context, Icons.event_note, 'রুটিন', () => context.go('/routine')),
        _actionItem(context, Icons.volunteer_activism, 'সহযোগিতা', () => context.go('/support')),
        _actionItem(context, Icons.contact_phone, 'যোগাযোগ', () => context.go('/contact')),
      ],
    );
  }

  Widget _actionItem(BuildContext context, IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
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
        color: ColorUtil.logoGreen.withOpacity(0.05),
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
        Text(
          count,
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: ColorUtil.logoGreen,
          ),
        ),
        Text(label, style: TextStyle(fontSize: 12.sp, color: Colors.grey[600])),
      ],
    );
  }

  Widget _buildHighlightsList({
    required BuildContext context,
    required List<ProjectHighlight> items,
  }) {
    return SizedBox(
      height: 210.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return SizedBox(
            width: 280.w,
            child: InkWell(
              onTap: () => context.go('/project/${item.id}', extra: item),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ProjectImage(
                      height: 90.h,
                      imageUrl: item.imageUrl,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'স্থান: ${item.address}',
                            style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            item.details,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Model (later: Firestore থেকে map করবেন)

/// Image widget: image না থাকলে / load fail হলে logo দেখাবে
class _ProjectImage extends StatelessWidget {
  final double height;
  final String? imageUrl;
  const _ProjectImage({required this.height, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.vertical(top: Radius.circular(12.r));

    Widget fallbackLogo() => Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: borderRadius,
      ),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 42.h,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) =>
              Icon(Icons.image_not_supported, color: Colors.grey[400]),
        ),
      ),
    );

    if (imageUrl == null || imageUrl!.trim().isEmpty) {
      return fallbackLogo();
    }

    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        imageUrl!,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => fallbackLogo(),
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            height: height,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: borderRadius),
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
      ),
    );
  }
}