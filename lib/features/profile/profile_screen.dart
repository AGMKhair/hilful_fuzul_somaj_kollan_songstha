import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false; // Placeholder for auth state

    return Scaffold(
      appBar: AppBar(
        title: const Text('প্রোফাইল'),
      ),
      body: isLoggedIn ? _buildProfile(context) : _buildLoginPrompt(context),
    );
  }

  Widget _buildLoginPrompt(BuildContext context) {
    return Center(

      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle_outlined, size: 100, color: Colors.grey[400]),
            const SizedBox(height: 20),
            const Text(
              'আপনার প্রোফাইল এবং আবেদনের তথ্য দেখতে লগইন করুন।',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text('লগইন / সাইন আপ'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Center(
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: Color(0xFF11539D),
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              SizedBox(height: 10),
              Text('ব্যবহারকারীর নাম', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('user@example.com', style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 30),
        _profileItem(Icons.history, 'আমার আবেদনের তালিকা', () {}),
        _profileItem(Icons.favorite_border, 'ডোনেশন হিস্ট্রি', () {}),
        _profileItem(Icons.notifications_none, 'নোটিফিকেশন', () {}),
        _profileItem(Icons.edit_outlined, 'প্রোফাইল এডিট করুন', () {}),
        const Divider(),
        _profileItem(Icons.logout, 'লগআউট', () {}, color: Colors.red),
      ],
    );
  }

  Widget _profileItem(IconData icon, String title, VoidCallback onTap, {Color? color}) {
    return ListTile(
      leading: Icon(icon, color: color ?? const Color(0xFF11539D)),
      title: Text(title, style: TextStyle(color: color)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      onTap: onTap,
    );
  }
}
