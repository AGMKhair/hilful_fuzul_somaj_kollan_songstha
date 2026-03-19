import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('যোগাযোগ'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            // Logo / Header Image
            Container(
              padding: EdgeInsets.all(20.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Image.asset(
                'assets/images/logo.png',
                height: 80.h,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.handshake,
                  size: 60.sp,
                  color: ColorUtil.logoBlue,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: ColorUtil.logoBlue,
              ),
            ),
            SizedBox(height: 10.h),
            const Text(
              'মানবতার কল্যাণে আমাদের পথচলা',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 30.h),

            // Contact Info Cards
            _buildContactItem(
              icon: Icons.location_on,
              title: 'ঠিকানা',
              content: 'ভাওরকোট, জয়াগ, সোনাইমুড়ী, নোয়াখালী।',
            ),
            _buildContactItem(
              icon: Icons.phone,
              title: 'মোবাইল',
              content: '+৮৮০ ১XXXXXXXXX\n+৮৮০ ১XXXXXXXXX',
            ),
            _buildContactItem(
              icon: Icons.email,
              title: 'ইমেইল',
              content: 'hilfulfuzul@example.com',
            ),
            _buildContactItem(
              icon: Icons.facebook,
              title: 'ফেসবুক পেজ',
              content: 'facebook.com/hilfulfuzul',
              isLink: true,
              onTap: () {
                // এখানে ফেসবুক লিঙ্ক ওপেন করার লজিক দিতে পারেন
              },
            ),

            SizedBox(height: 40.h),
            const Divider(),
            SizedBox(height: 20.h),
            Text(
              'আমাদের সাথে যুক্ত থাকুন',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20.h),
            // Social Icons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _socialIcon(Icons.facebook, Color(0xFF1877F2)),
                SizedBox(width: 20.w),
                _socialIcon(Icons.apple, Color(0xFF25D366)),
                SizedBox(width: 20.w),
                _socialIcon(Icons.language, ColorUtil.logoBlue),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget _buildContactItem({
    required IconData icon,
    required String title,
    required String content,
    bool isLink = false,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.h),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(color: Colors.grey.withOpacity(0.2)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        leading: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: ColorUtil.logoBlue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Icon(icon, color: ColorUtil.logoBlue, size: 24.sp),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        subtitle: Text(
          content,
          style: TextStyle(
            fontSize: 15.sp,
            color: isLink ? Colors.blue : Colors.black87,
            decoration: isLink ? TextDecoration.underline : null,
          ),
        ),
      ),
    );
  }

  Widget _socialIcon(IconData icon, Color color) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 28.sp),
      ),
    );
  }
}
