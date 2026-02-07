import 'package:flutter/material.dart';
import 'profile_page.dart';
import 'checkin_page.dart';
import 'setting.dart';
import 'toko.dart';

/// Main HomePage dengan Bottom Navigation - Tokopedia Dark Mode
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // List screens untuk IndexedStack
  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const TokoWithAppBar(), // Home/Toko dengan AppBar
      const CheckInPage(), // CheckIn/Keranjang
      const ProfilePage(), // Profile
      const Settingpage(), // Setting
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Dark background
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF2C2C2C), // Dark surface
        selectedItemColor: const Color(0xFF03AC0E), // Tokopedia green (dark mode)
        unselectedItemColor: const Color(0xFF808080), // Medium gray
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 8,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'CheckIn',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
      ),
    );
  }
}

/// Wrapper untuk Toko dengan Custom AppBar - Tokopedia Dark Mode
class TokoWithAppBar extends StatelessWidget {
  const TokoWithAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), // Dark background
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C), // Dark surface untuk AppBar
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: Row(
          children: [
            // Search Box
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF3C3C3C), // Dark search box
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF4C4C4C), // Subtle border
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF), // White text
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari produk, kategori, brand...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF808080), // Gray hint text
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF03AC0E), // Green icon
                      size: 20,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                  onTap: () {
                    // Fake search - tidak melakukan apa-apa
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text(
                          'Fitur pencarian dalam pengembangan',
                          style: TextStyle(color: Color(0xFFFFFFFF)),
                        ),
                        backgroundColor: const Color(0xFF2C2C2C),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        actions: [
          // Keranjang Icon dengan Badge
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Color(0xFFFFFFFF), // White icon
                  size: 24,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CheckInPage()),
                  );
                },
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFF4444), // Bright red untuk dark mode
                    shape: BoxShape.circle,
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: const Text(
                    '3',
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
          
          // Profile Icon
          IconButton(
            icon: const Icon(
              Icons.person_outline,
              color: Color(0xFFFFFFFF), // White icon
              size: 24,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: const Toko(), // Halaman Toko original Anda
    );
  }
}