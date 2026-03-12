import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({super.key});

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSector;
  String? _paymentMethod;
  final _amountController = TextEditingController();
  final _trxIdController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  final List<String> _sectors = [
    'সাধারণ দান (General)',
    'খাদ্য বিতরণ',
    'চিকিৎসা সহায়তা',
    'শিক্ষা সহায়তা',
    'মসজিদ/মাদরাসা',
    'এতিম তহবিল',
  ];

  final List<String> _methods = ['Cash','bKash', 'Nagad', 'Rocket', 'Bank Transfer'];

  Future<void> _submitDonation() async {
    if (_formKey.currentState!.validate() && _selectedSector != null && _paymentMethod != null) {
      setState(() => _isLoading = true);
      try {
        await FirebaseFirestore.instance.collection('donations').add({
          'sector': _selectedSector,
          'method': _paymentMethod,
          'amount': double.tryParse(_amountController.text) ?? 0,
          'transactionId': _trxIdController.text,
          'senderPhone': _phoneController.text,
          'status': 'Pending',
          'createdAt': FieldValue.serverTimestamp(),
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('আপনার ডোনেশন তথ্যটি সফলভাবে জমা হয়েছে। আমরা শীঘ্রই এটি ভেরিফাই করব।')),
          );
          Navigator.pop(context);
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('এরর: $e')),
        );
      } finally {
        if (mounted) setState(() => _isLoading = false);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('অনুগ্রহ করে সব তথ্য সঠিকবাবে পূরণ করুন।')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ডোনেশন সাবমিট'),
        centerTitle: true,
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: ColorUtil.logoGradient),
        ),
      ),
      body: _isLoading 
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('কোন খাতে দিতে চান?', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedSector,
                      items: _sectors.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                      onChanged: (val) => setState(() => _selectedSector = val),
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'সেক্টর সিলেক্ট করুন'),
                    ),
                    const SizedBox(height: 20),
                    const Text('পেমেন্ট মেথড', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _paymentMethod,
                      items: _methods.map((m) => DropdownMenuItem(value: m, child: Text(m))).toList(),
                      onChanged: (val) => setState(() => _paymentMethod = val),
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'মেথড সিলেক্ট করুন'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('টাকার পরিমাণ', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _amountController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'যেমন: ৫০০'),
                                validator: (val) => val!.isEmpty ? 'পরিমাণ দিন' : null,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Transaction ID', style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              TextFormField(
                                controller: _trxIdController,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'Ex: TR1023X'),
                                validator: (val) => val!.isEmpty ? 'TrxID দিন' : null,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text('প্রেরকের নম্বর (ফোন)', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: 'আপনার নম্বর'),
                      validator: (val) => val!.isEmpty ? 'নম্বর দিন' : null,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitDonation,
                        child: const Text('সাবমিট করুন'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
