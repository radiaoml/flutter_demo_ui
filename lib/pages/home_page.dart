import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  final List<Map<String, String>> items = const [
    {'image': 'assets/item1.png', 'label': '1 pc Stainless Steel + PP Material Desktop Bookshelf'},
    {'image': 'assets/item2.png', 'label': 'A Multifunctional Desktop Storage Box with a Tissue Holder'},
    {'image': 'assets/item3.png', 'label': 'AMil RGB LED Desk Lamp with Headphone Stand - USB Powered, Color Changing for Gaming Room'},
    {'image': 'assets/item4.png', 'label': '1 pc Under Desk Organiser Rack, Adjustable No-Drill Extendable Cable Management Shelf'},
    {'image': 'assets/item5.png', 'label': '1 Ergonomic Arm Support Wrist Rest - Synthetic Rubber Computer Desk Extender with Adjustable Height'},
    {'image': 'assets/item6.png', 'label': '1 pc Large Waterproof Faux Leather Desk Protector Mat - Premium Mouse Pad & Keyboard Pad for Office, Gaming or Home Use'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text('Home Page'),
        elevation: 4,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.indigo, Colors.indigoAccent],
                ),
              ),
              accountName: const Text('Radia Omalek'),
              accountEmail: const Text('radia@example.com'),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage('assets/avatar.png'),
                backgroundColor: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AboutPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_mail),
              title: const Text('Contact'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactPage()),
                );
              },
            ),
            const Spacer(),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout'),
              onTap: () => _logout(context),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: List.generate(items.length, (index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.indigo[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        items[index]['image']!,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    items[index]['label']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
