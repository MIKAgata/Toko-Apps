import 'package:flutter/material.dart';
import 'dart:async';
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
      backgroundColor: const Color(0xFF1C1C1C), 
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
        backgroundColor: const Color(0xFF2C2C2C), 
        selectedItemColor: const Color(0xFF03AC0E), 
        unselectedItemColor: const Color(0xFF808080), 
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

/// Wrapper untuk Toko dengan Custom AppBar dan Banner Promo
class TokoWithAppBar extends StatefulWidget {
  const TokoWithAppBar({super.key});

  @override
  State<TokoWithAppBar> createState() => _TokoWithAppBarState();
}

class _TokoWithAppBarState extends State<TokoWithAppBar> {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  Timer? _bannerTimer;

  // Data banner promo (tanpa gambar, pakai gradient)
  final List<Map<String, dynamic>> _bannerData = [
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFF03AC0E), Color(0xFF05C010)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Banner Promo 1',
      'subtitle': 'belum ditambahkan',
    },
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Banner Promo 2',
      'subtitle': 'belum ditambahkan',
    },
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFFFF6B00), Color(0xFFFF8A3D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Banner Promo 3',
      'subtitle': 'belum ditambahkan',
    },
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Banner Promo 4',
      'subtitle': 'belum ditambahkan',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startBannerAutoSlide();
  }

  @override
  void dispose() {
    _bannerTimer?.cancel();
    _bannerController.dispose();
    super.dispose();
  }

  /// Auto-slide banner setiap 4 detik
  void _startBannerAutoSlide() {
    _bannerTimer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentBannerIndex < _bannerData.length - 1) {
        _currentBannerIndex++;
      } else {
        _currentBannerIndex = 0;
      }

      if (_bannerController.hasClients) {
        _bannerController.animateToPage(
          _currentBannerIndex,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C1C1C), 
      appBar: AppBar(
        backgroundColor: const Color(0xFF2C2C2C), 
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: Row(
          children: [
            
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF3C3C3C), 
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF4C4C4C), 
                    width: 1,
                  ),
                ),
                child: TextField(
                  style: const TextStyle(
                    color: Color(0xFFFFFFFF), 
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Cari produk, kategori, brand...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF808080), 
                      fontSize: 14,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF03AC0E), 
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
      body: Column(
        children: [
          
          _buildBannerSection(),
          
          
          const Expanded(
            child: Toko(),
          ),
        ],
      ),
    );
  }

  
  Widget _buildBannerSection() {
    return Column(
      children: [
        const SizedBox(height: 16),
        
      
        SizedBox(
          height: 180,
          child: PageView.builder(
            controller: _bannerController,
            onPageChanged: (index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            itemCount: _bannerData.length,
            itemBuilder: (context, index) {
              return _buildBannerItem(
                gradient: _bannerData[index]['gradient'] as LinearGradient,
                title: _bannerData[index]['title'] as String,
                subtitle: _bannerData[index]['subtitle'] as String,
              );
            },
          ),
        ),

        const SizedBox(height: 12),

        // Dot Indicators
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _bannerData.length,
            (index) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentBannerIndex == index ? 24 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: _currentBannerIndex == index
                    ? const Color(0xFF03AC0E)
                    : const Color(0xFF4C4C4C),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        
        const SizedBox(height: 16),
      ],
    );
  }

  /// Build individual banner item
  Widget _buildBannerItem({
    required LinearGradient gradient,
    required String title,
    required String subtitle,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Overlay pattern (optional)
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.3),
                ],
              ),
            ),
          ),
          
          // Text Content
          Positioned(
            left: 20,
            bottom: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    shadows: [
                      Shadow(
                        color: Colors.black45,
                        offset: Offset(1, 1),
                        blurRadius: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}