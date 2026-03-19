import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('আমাদের টিম'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: const Center(
        child: Text('আমাদের টিমের সদস্যদের তালিকা এখানে থাকবে...'),
      ),
    );
  }
}
