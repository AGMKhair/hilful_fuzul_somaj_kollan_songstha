import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hilful_fuzul_somaj_kollan_songstha/core/utils/color_util.dart';

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
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        final shouldExit = await showDialog<bool>(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('অ্যাপ বন্ধ করবেন?'),
            content: const Text('আপনি কি সত্যিই অ্যাপ থেকে বের হতে চান?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('না'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('হ্যাঁ'),
              ),
            ],
          ),
        );

        if ((shouldExit ?? false)) {
          Navigator.of(context).pop(); // system back allow
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: _buildDrawer(context),
        body: widget.child,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => _onItemTapped(index, context),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'হোম'),
            BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'কার্যক্রম'),
            BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'রুটিন'),
            BottomNavigationBarItem(icon: Icon(Icons.volunteer_activism), label: 'সহায়তা'),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'মেনু'),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: ColorUtil.logoGradient,
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
                      errorBuilder: (context, error, stackTrace) => const Icon(Icons.handshake, size: 40, color: ColorUtil.logoBlue),
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
              _selectedIndex = 4;
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
      leading: Icon(icon, color: ColorUtil.logoBlue),
      title: Text(title),
      onTap: onTap,
    );
  }
}
