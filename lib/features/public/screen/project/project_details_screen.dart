import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/public/model/project_hiligts.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final ProjectHighlight project;
  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রজেক্ট বিস্তারিত'),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [ColorUtil.logoBlue, ColorUtil.logoGreen],
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _DetailsImage(imageUrl: project.imageUrl),
          SizedBox(height: 14.h),
          Text(project.name, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.location_on, size: 18.sp, color: Colors.grey[700]),
              SizedBox(width: 6.w),
              Expanded(
                child: Text(
                  project.address,
                  style: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
                ),
              ),
            ],
          ),
          SizedBox(height: 14.h),
          Text(
            'বিস্তারিত',
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 8.h),
          Text(
            project.details,
            style: TextStyle(fontSize: 14.sp, height: 1.4, color: Colors.grey[800]),
          ),
        ],
      ),
    );
  }
}

class _DetailsImage extends StatelessWidget {
  final String? imageUrl;
  const _DetailsImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final border = BorderRadius.circular(14.r);

    Widget fallback() => Container(
      height: 190.h,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: border),
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 70.h,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => Icon(Icons.image, color: Colors.grey[400], size: 40),
        ),
      ),
    );

    if (imageUrl == null || imageUrl!.trim().isEmpty) return fallback();

    return ClipRRect(
      borderRadius: border,
      child: Image.network(
        imageUrl!,
        height: 190.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => fallback(),
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Container(
            height: 190.h,
            decoration: BoxDecoration(color: Colors.grey[100], borderRadius: border),
            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          );
        },
      ),
    );
  }
}