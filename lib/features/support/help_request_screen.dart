import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

class HelpRequestScreen extends StatefulWidget {
  const HelpRequestScreen({super.key});

  @override
  State<HelpRequestScreen> createState() => _HelpRequestScreenState();
}

class _HelpRequestScreenState extends State<HelpRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedSector;
  final _descriptionController = TextEditingController();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  final List<String> _sectors = [
    'খাদ্য বিতরণ',
    'চিকিৎসা সহায়তা',
    'শিক্ষা সহায়তা',
    'জরুরি ত্রাণ',
    'আইনি সহায়তা',
    'পুনর্বাসন',
  ];

  Future<void> _submitRequest() async {
    if (_formKey.currentState!.validate() && _selectedSector != null) {
      setState(() => _isLoading = true);
      try {
        await FirebaseFirestore.instance.collection('help_requests').add({
          'sector': _selectedSector,
          'description': _descriptionController.text,
          'phone': _phoneController.text,
          'status': 'Pending',
          'createdAt': FieldValue.serverTimestamp(),
        });
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('আপনার আবেদনটি সফলভাবে জমা হয়েছে।')),
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
    } else if (_selectedSector == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('অনুগ্রহ করে একটি সেক্টর নির্বাচন করুন।')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('সহযোগিতার আবেদন'),
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
                    const Text('সেক্টর নির্বাচন করুন', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedSector,
                      hint: const Text('সেক্টর সিলেক্ট করুন'),
                      items: _sectors.map((sector) {
                        return DropdownMenuItem(value: sector, child: Text(sector));
                      }).toList(),
                      onChanged: (val) => setState(() => _selectedSector = val),
                      decoration: const InputDecoration(border: OutlineInputBorder()),
                    ),
                    const SizedBox(height: 20),
                    const Text('বিস্তারিত বিবরণ', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _descriptionController,
                      maxLines: 5,
                      decoration: const InputDecoration(
                        hintText: 'আপনার কী ধরনের সহায়তা প্রয়োজন তা বিস্তারিত লিখুন...',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val!.isEmpty ? 'বিবরণ দিন' : null,
                    ),
                    const SizedBox(height: 20),
                    const Text('ফোন নম্বর', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: 'আপনার সচল ফোন নম্বরটি দিন',
                        border: OutlineInputBorder(),
                      ),
                      validator: (val) => val!.isEmpty ? 'ফোন নম্বর দিন' : null,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _submitRequest,
                        child: const Text('আবেদন জমা দিন'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
