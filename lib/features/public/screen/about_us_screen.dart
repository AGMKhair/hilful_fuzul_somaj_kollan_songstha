import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমাদের সম্পর্কে'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection('content').doc('about_us').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          String description = 'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা একটি অরাজনৈতিক ও অলাভজনক সামাজিক সংগঠন। আমরা মানবতার কল্যাণে কাজ করে যাচ্ছি।';
          String? imageUrl;

          if (snapshot.hasData && snapshot.data!.exists) {
            final data = snapshot.data!.data() as Map<String, dynamic>;
            description = data['description'] ?? description;
            imageUrl = data['imageUrl'];
          }

          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: imageUrl != null
                      ? Image.network(
                          imageUrl,
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
                        )
                      : _buildFallbackImage(),
                ),
                SizedBox(height: 20.h),
                Text(
                  'আমাদের ইতিহাস ও পরিচিতি',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorUtil.logoBlue,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15.sp,
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      height: 200.h,
      width: double.infinity,
      color: Colors.grey[100],
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 100.h,
          errorBuilder: (_, __, ___) => Icon(Icons.handshake, size: 80.sp, color: ColorUtil.logoBlue),
        ),
      ),
    );
  }
}
