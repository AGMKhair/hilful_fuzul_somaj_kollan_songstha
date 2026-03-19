import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('গ্যালারি'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('gallery').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/logo.png', height: 100.h, errorBuilder: (_, __, ___) => Icon(Icons.photo_library, size: 80, color: Colors.grey[300])),
                  const SizedBox(height: 10),
                  const Text('কোন ছবি পাওয়া যায়নি'),
                ],
              ),
            );
          }

          return GridView.builder(
            padding: EdgeInsets.all(12.w),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 1,
            ),
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final doc = snapshot.data!.docs[index];
              final data = doc.data() as Map<String, dynamic>;
              final String? imageUrl = data['imageUrl'];

              return ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: imageUrl != null
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => _buildFallbackImage(),
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[100],
                            child: const Center(child: CircularProgressIndicator(strokeWidth: 2)),
                          );
                        },
                      )
                    : _buildFallbackImage(),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      color: Colors.grey[100],
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 50.h,
          errorBuilder: (_, __, ___) => Icon(Icons.image, size: 40.sp, color: Colors.grey[300]),
        ),
      ),
    );
  }
}
