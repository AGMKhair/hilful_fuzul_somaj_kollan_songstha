import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সেটিংস'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ListTile(
            leading: const Icon(Icons.language, color: ColorUtil.logoBlue),
            title: const Text('ভাষা (Language)'),
            subtitle: const Text('বাংলা'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.notifications_none, color: ColorUtil.logoBlue),
            title: const Text('নোটিফিকেশন'),
            trailing: Switch(value: true, onChanged: (val) {}),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline, color: ColorUtil.logoBlue),
            title: const Text('অ্যাপ ভার্সন'),
            subtitle: const Text('১.০.০'),
          ),
        ],
      ),
    );
  }
}
