import 'package:flutter/material.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class FundSummaryScreen extends StatelessWidget {
  const FundSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Demo data (পরে Firestore থেকে sum করবেন)
    final totalDonation = 1000000.0;
    final totalExpense = 1100000.0;
    final balance = totalDonation - totalExpense;

    return Scaffold(
      appBar: AppBar(
        title: const Text('ফান্ড সারাংশ'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: ColorUtil.logoGradient),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _summaryCard(
              title: 'মোট ডোনেশন',
              amount: totalDonation,
              icon: Icons.volunteer_activism,
              color: ColorUtil.logoGreen,
            ),
            const SizedBox(height: 12),
            _summaryCard(
              title: 'মোট ব্যয়',
              amount: totalExpense,
              icon: Icons.receipt_long,
              color: Colors.orange,
            ),
            const SizedBox(height: 12),
            _summaryCard(
              title: 'বর্তমান ব্যালেন্স',
              amount: balance,
              icon: Icons.account_balance_wallet,
              color: ColorUtil.logoBlue,
            ),
            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.grey.shade700),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                        'এগুলো সংক্ষিপ্ত হিসাব। বিস্তারিত ব্যয়ের তালিকা জানতে অনুগ্রহ করে কর্তৃপক্ষের সাথে যোগাযোগ করুন।',                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard({
    required String title,
    required double amount,
    required IconData icon,
    required Color color,
  }) {
    String formatAmount(double v) => '৳ ${v.toStringAsFixed(0)}';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: color.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color)),
                const SizedBox(height: 6),
                Text(
                  formatAmount(amount),
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}