import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/support/donation_screen.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/support/fund_summary_screen.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/features/support/help_request_screen.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সহযোগিতা সেন্টার'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: ColorUtil.logoGradient,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSupportCard(
              context,
              title: 'সহযোগিতা চাই',
              subtitle: 'আপনার সমস্যার কথা আমাদের জানান। আমরা আপনার পাশে আছি।',
              icon: Icons.front_hand,
              color: Theme.of(context).primaryColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpRequestScreen()),
                );
              },
            ),
            const SizedBox(height: 20),

            _buildSupportCard(
              context,
              title: 'ডোনেশন দিন',
              subtitle: 'আপনার সামান্য দানে একজন মানুষের জীবন বদলে যেতে পারে।',
              icon: Icons.volunteer_activism,
              color: ColorUtil.logoGreen,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const DonationScreen()),
                );
              },
            ),
            const SizedBox(height: 20),

            // Fund Summary
            _buildSupportCard(
              context,
              title: 'ফান্ড সারাংশ',
              subtitle: 'এখন পর্যন্ত মোট ডোনেশন ও মোট ব্যয়ের সংক্ষিপ্ত হিসাব দেখুন।',
              icon: Icons.pie_chart_rounded,
              color: ColorUtil.logoBlue,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const FundSummaryScreen()),
                );
              },
            ),

            const SizedBox(height: 30),
            const Divider(),
            const SizedBox(height: 10),
            Text(
              'আপনার পূর্ববর্তী আবেদনগুলো দেখতে লগইন করুন',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData icon,
        required Color color,
        required VoidCallback onTap,
      }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 16),
          ],
        ),
      ),
    );
  }
}
