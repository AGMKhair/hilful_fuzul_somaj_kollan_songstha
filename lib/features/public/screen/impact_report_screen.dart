import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class ImpactReportScreen extends StatelessWidget {
  const ImpactReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ইমপ্যাক্ট রিপোর্ট'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: const Center(
        child: Text('ইমপ্যাক্ট রিপোর্ট লোড হচ্ছে...'),
      ),
    );
  }
}
