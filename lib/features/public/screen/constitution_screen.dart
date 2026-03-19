import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class ConstitutionScreen extends StatelessWidget {
  const ConstitutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('গঠনতন্ত্র'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: const Center(
        child: Text('গঠনতন্ত্রের বিস্তারিত এখানে থাকবে...'),
      ),
    );
  }
}
