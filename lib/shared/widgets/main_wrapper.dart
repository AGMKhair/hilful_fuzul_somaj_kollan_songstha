import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainWrapper extends StatefulWidget {
  final Widget child;
  const MainWrapper({super.key, required this.child});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onItemTapped(int index, BuildContext context) {
    if (index == 4) {
      _scaffoldKey.currentState?.openEndDrawer();
      return;
    }

    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/activities');
        break;
      case 2:
        GoRouter.of(context).go('/routine');
        break;
      case 3:
        GoRouter.of(context).go('/support');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _buildDrawer(context),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index, context),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Activities'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Routine'),
          BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'Support'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/logo.png',
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.handshake, size: 40, color: Color(0xFF11539D)),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'হিলফুল ফুজুল সমাজকল্যাণ সংস্থা',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          _drawerTile(Icons.person_outline, 'আমার প্রোফাইল', () {
            Navigator.pop(context);
            GoRouter.of(context).go('/profile');
            setState(() {
              _selectedIndex = 4; // Keep Menu selected or handle highlighting
            });
          }),
          const Divider(),
          _drawerTile(Icons.info_outline, 'আমাদের সম্পর্কে', () {}),
          _drawerTile(Icons.lightbulb_outline, 'লক্ষ্য ও উদ্দেশ্য', () {}),
          _drawerTile(Icons.photo_library_outlined, 'গ্যালারি', () {}),
          _drawerTile(Icons.newspaper, 'সংবাদ ও নোটিশ', () {}),
          _drawerTile(Icons.description_outlined, 'ইমপ্যাক্ট রিপোর্ট', () {}),
          _drawerTile(Icons.gavel, 'গঠনতন্ত্র', () {}),
          _drawerTile(Icons.groups_outlined, 'আমাদের টিম', () {}),
          _drawerTile(Icons.contact_support_outlined, 'যোগাযোগ', () {}),
          const Divider(),
          _drawerTile(Icons.settings_outlined, 'সেটিংস', () {}),
          _drawerTile(Icons.admin_panel_settings_outlined, 'অ্যাডমিন প্যানেল', () {}),
        ],
      ),
    );
  }

  Widget _drawerTile(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title),
      onTap: onTap,
    );
  }
}
