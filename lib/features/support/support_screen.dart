import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সহযোগিতা সেন্টার'),
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
                // Navigate to Help Request Form
              },
            ),
            const SizedBox(height: 20),
            _buildSupportCard(
              context,
              title: 'ডোনেশন দিন',
              subtitle: 'আপনার সামান্য দানে একজন মানুষের জীবন বদলে যেতে পারে।',
              icon: Icons.volunteer_activism,
              color: const Color(0xFF398200),
              onTap: () {
                // Navigate to Donation Form
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
