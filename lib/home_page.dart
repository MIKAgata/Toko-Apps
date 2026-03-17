import 'package:flutter/material.dart';
import 'dart:async';
import 'chat_page.dart';
import 'cart.dart';
import 'setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late final List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      const TokoWithAppBar(),
      const CheckInPage(),
      const ProfilePage(),
      const Settingpage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: TokopediaColors.cardBackground,
        selectedItemColor: TokopediaColors.primary,
        unselectedItemColor: TokopediaColors.textSecondary,
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
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat),
            label: 'Chat',
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

class TokopediaColors {
  static const Color primary = Color(0xFF42B549);
  static const Color primaryLight = Color(0xFF5BC862);
  static const Color primaryDark = Color(0xFF2FA037);

  static const Color background = Color(0xFF0E1113);
  static const Color cardBackground = Color(0xFF1A1D1F);
  static const Color searchBackground = Color(0xFF272B30);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFADB5BD);
  static const Color textTertiary = Color(0xFF6C757D);

  static const Color orange = Color(0xFFFF6B00);
  static const Color red = Color(0xFFFF4444);
  static const Color yellow = Color(0xFFFFCC00);

  static const Color divider = Color(0xFF2D3134);
  static const Color border = Color(0xFF3A3F42);
}

/// Responsive Breakpoints
class ResponsiveBreakpoints {
  static const double mobile = 600;
  static const double tablet = 900;
  static const double desktop = 1200;
}

class Product {
  final String name;
  final String price;
  final String originalPrice;
  final String discount;
  final double rating;
  final int sold;
  final String location;
  final String imageUrl;
  final bool isFreeShipping;
  final String badge;

  Product({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.rating,
    required this.sold,
    required this.location,
    required this.imageUrl,
    this.isFreeShipping = false,
    this.badge = '',
  });
}

class TokoWithAppBar extends StatefulWidget {
  const TokoWithAppBar({super.key});

  @override
  State<TokoWithAppBar> createState() => _TokoWithAppBarState();
}

class _TokoWithAppBarState extends State<TokoWithAppBar> {
  final PageController _bannerController = PageController();
  int _currentBannerIndex = 0;
  Timer? _bannerTimer;

  final List<Map<String, dynamic>> _bannerData = [
    {
      'imageUrl': 'assets/images/benner/b.jpg',
      'gradient': const LinearGradient(
        colors: [Color(0xFF42B549), Color(0xFF5BC862)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Flash Sale 12.12',
      'subtitle': 'Diskon hingga 90%',
    },
    {
      'imageUrl': 'assets/images/benner/b2.jpg',
      'gradient': const LinearGradient(
        colors: [Color(0xFFFF6B00), Color(0xFFFF8A3D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Gratis Ongkir',
      'subtitle': 'Min. belanja Rp 0',
    },
    {
      'imageUrl': 'assets/images/benner/b3.jpg',
      'gradient': const LinearGradient(
        colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Cashback 50%',
      'subtitle': 'Pakai OVO/GoPay',
    },
    {
      'imageUrl': 'assets/images/benner/b4.jpg',
      'gradient': const LinearGradient(
        colors: [Color(0xFF9C27B0), Color(0xFFBA68C8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Voucher Toko',
      'subtitle': 'Klaim sekarang',
    },
  ];

  final List<Product> _products = [
    Product(
      name: 'ROG ZEPHYRUS',
      price: 'Rp32.999.000',
      originalPrice: 'Rp41.999.000',
      discount: '13%',
      rating: 4.9,
      sold: 1250,
      location: 'Jakarta Pusat',
      imageUrl: 'images/produk/p.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'ROG TRIX SCAR 17 SE',
      price: 'Rp15.499.000',
      originalPrice: 'Rp17.999.000',
      discount: '14%',
      rating: 4.8,
      sold: 890,
      location: 'Tangerang',
      imageUrl: 'images/produk/p2.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'PC Geming',
      price: 'Rp28.999.000',
      originalPrice: 'Rp10.499.000',
      discount: '14%',
      rating: 4.7,
      sold: 2340,
      location: 'Surabaya',
      imageUrl: 'images/produk/p3.jpg',
      isFreeShipping: true,
      badge: 'Top Seller',
    ),
    Product(
      name: 'Leptop Victus geming',
      price: 'Rp16.499.000',
      originalPrice: 'Rp18.999.000',
      discount: '13%',
      rating: 5.0,
      sold: 456,
      location: 'Jakarta Selatan',
      imageUrl: 'images/produk/p4.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'PC Geming I3',
      price: 'Rp4.299.000',
      originalPrice: 'Rp5.499.000',
      discount: '22%',
      rating: 4.9,
      sold: 3450,
      location: 'Bandung',
      imageUrl: 'images/produk/p5.jpg',
      isFreeShipping: true,
      badge: 'Best Seller',
    ),
    Product(
      name: 'Apple AirPods Pro 2nd Generation USB-C Original',
      price: 'Rp3.499.000',
      originalPrice: 'Rp3.999.000',
      discount: '13%',
      rating: 4.8,
      sold: 5670,
      location: 'Jakarta Barat',
      imageUrl: 'images/produk/p6.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'iPad Air M2 11 inch WiFi 128GB 2024 - Space Gray',
      price: 'Rp9.499.000',
      originalPrice: 'Rp10.999.000',
      discount: '14%',
      rating: 4.9,
      sold: 678,
      location: 'Medan',
      imageUrl: 'images/produk/p7.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Logitech MX Master 3S Wireless Mouse - Graphite',
      price: 'Rp1.399.000',
      originalPrice: 'Rp1.699.000',
      discount: '18%',
      rating: 4.8,
      sold: 4560,
      location: 'Semarang',
      imageUrl: 'images/produk/p1.jpg',
      isFreeShipping: false,
      badge: 'Top Seller',
    ),
    Product(
      name: 'ASUS ROG Strix G16 RTX 4060 i7-13650HX 16GB 512GB',
      price: 'Rp19.999.000',
      originalPrice: 'Rp23.999.000',
      discount: '17%',
      rating: 4.9,
      sold: 234,
      location: 'Jakarta Utara',
      imageUrl: 'images/produk/p.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Apple Watch Series 9 GPS 45mm Midnight Aluminum',
      price: 'Rp6.999.000',
      originalPrice: 'Rp7.999.000',
      discount: '13%',
      rating: 4.8,
      sold: 1890,
      location: 'Jakarta Pusat',
      imageUrl: 'images/produk/p2.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'Samsung Galaxy Z Flip 5 8/256GB Garansi Resmi SEIN',
      price: 'Rp12.999.000',
      originalPrice: 'Rp14.999.000',
      discount: '13%',
      rating: 4.7,
      sold: 567,
      location: 'Bekasi',
      imageUrl: 'images/produk/p3.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'PlayStation 5 Slim Digital Edition 1TB + 2 DualSense',
      price: 'Rp7.499.000',
      originalPrice: 'Rp8.999.000',
      discount: '17%',
      rating: 5.0,
      sold: 2345,
      location: 'Jakarta Selatan',
      imageUrl: 'images/produk/p4.jpg',
      isFreeShipping: true,
      badge: 'Best Seller',
    ),
    Product(
      name: 'LG OLED C3 55 inch 4K Smart TV WebOS 23 HDR10',
      price: 'Rp18.999.000',
      originalPrice: 'Rp22.999.000',
      discount: '17%',
      rating: 4.9,
      sold: 345,
      location: 'Tangerang Selatan',
      imageUrl: 'images/produk/p5.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Canon EOS R6 Mark II Body Only Garansi Resmi Datascrip',
      price: 'Rp34.999.000',
      originalPrice: 'Rp39.999.000',
      discount: '13%',
      rating: 5.0,
      sold: 123,
      location: 'Jakarta Barat',
      imageUrl: 'images/produk/p6.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'DJI Mini 4 Pro Fly More Combo Plus RC 2 Controller',
      price: 'Rp16.999.000',
      originalPrice: 'Rp19.999.000',
      discount: '15%',
      rating: 4.9,
      sold: 456,
      location: 'Surabaya',
      imageUrl: 'images/produk/p7.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Bose QuietComfort Ultra Headphones Wireless ANC',
      price: 'Rp5.999.000',
      originalPrice: 'Rp6.999.000',
      discount: '14%',
      rating: 4.8,
      sold: 2890,
      location: 'Bandung',
      imageUrl: 'images/produk/p1.jpg',
      isFreeShipping: true,
      badge: 'Best Seller',
    ),
    Product(
      name: 'Herman Miller Aeron Chair Ergonomic Office Chair Size B',
      price: 'Rp24.999.000',
      originalPrice: 'Rp28.999.000',
      discount: '14%',
      rating: 5.0,
      sold: 89,
      location: 'Jakarta Selatan',
      imageUrl: 'images/produk/p.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Nintendo Switch OLED Model White 64GB Bundle',
      price: 'Rp5.299.000',
      originalPrice: 'Rp5.999.000',
      discount: '12%',
      rating: 4.9,
      sold: 3456,
      location: 'Jakarta Pusat',
      imageUrl: 'images/produk/p2.jpg',
      isFreeShipping: true,
      badge: 'Top Seller',
    ),
    Product(
      name: 'Dyson V15 Detect Absolute Cordless Vacuum Cleaner',
      price: 'Rp12.499.000',
      originalPrice: 'Rp14.999.000',
      discount: '17%',
      rating: 4.8,
      sold: 567,
      location: 'Tangerang',
      imageUrl: 'images/produk/p3.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Sony Alpha A7 IV Body Only Mirrorless Camera 33MP',
      price: 'Rp32.999.000',
      originalPrice: 'Rp37.999.000',
      discount: '13%',
      rating: 5.0,
      sold: 234,
      location: 'Surabaya',
      imageUrl: 'images/produk/p4.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'GoPro Hero 12 Black Action Camera 5.3K HDR Video',
      price: 'Rp6.299.000',
      originalPrice: 'Rp7.499.000',
      discount: '16%',
      rating: 4.8,
      sold: 1890,
      location: 'Bandung',
      imageUrl: 'images/produk/p5.jpg',
      isFreeShipping: true,
      badge: 'Best Seller',
    ),
    Product(
      name: 'Samsung Odyssey G9 49 inch Curved Gaming Monitor 240Hz',
      price: 'Rp22.999.000',
      originalPrice: 'Rp26.999.000',
      discount: '15%',
      rating: 4.9,
      sold: 345,
      location: 'Jakarta Utara',
      imageUrl: 'images/produk/p6.jpg',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Razer Blade 15 RTX 4070 i9-13900H 32GB 1TB Gaming Laptop',
      price: 'Rp38.999.000',
      originalPrice: 'Rp44.999.000',
      discount: '13%',
      rating: 5.0,
      sold: 123,
      location: 'Jakarta Selatan',
      imageUrl: 'images/produk/p7.jpg',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'Keychron Q1 Pro QMK/VIA Wireless Custom Mechanical Keyboard',
      price: 'Rp2.999.000',
      originalPrice: 'Rp3.499.000',
      discount: '14%',
      rating: 4.9,
      sold: 2567,
      location: 'Medan',
      imageUrl: 'images/produk/p1.jpg',
      isFreeShipping: false,
      badge: 'Top Seller',
    ),
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
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        
        // Tentukan apakah mobile, tablet, atau desktop
        final isMobile = width < ResponsiveBreakpoints.mobile;
        final isTablet = width >= ResponsiveBreakpoints.mobile && 
                        width < ResponsiveBreakpoints.desktop;
        final isDesktop = width >= ResponsiveBreakpoints.desktop;

        return Scaffold(
          backgroundColor: TokopediaColors.background,
          appBar: _buildAppBar(context, width),
          body: _buildBody(isMobile, isTablet, isDesktop, width),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, double screenWidth) {
    final isMobile = screenWidth < ResponsiveBreakpoints.mobile;
    
    return AppBar(
      backgroundColor: TokopediaColors.cardBackground,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      centerTitle: false,
      title: Row(
        children: [
          // Logo (untuk desktop/tablet)
          if (!isMobile)
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                'Tokopedia',
                style: TextStyle(
                  color: TokopediaColors.primary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          
          // Search Bar
          Expanded(
            child: Container(
              height: 40,
              constraints: BoxConstraints(
                maxWidth: isMobile ? double.infinity : 600,
              ),
              decoration: BoxDecoration(
                color: TokopediaColors.searchBackground,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: TokopediaColors.border, width: 1),
              ),
              child: TextField(
                style: const TextStyle(
                  color: TokopediaColors.textPrimary,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  hintText: 'Cari produk, kategori, brand...',
                  hintStyle: const TextStyle(
                    color: TokopediaColors.textSecondary,
                    fontSize: 14,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: TokopediaColors.primary,
                    size: 20,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                ),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text(
                        'Fitur pencarian dalam pengembangan',
                        style: TextStyle(color: TokopediaColors.textPrimary),
                      ),
                      backgroundColor: TokopediaColors.cardBackground,
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
        // Cart Icon
        Stack(
          children: [
            IconButton(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: TokopediaColors.textPrimary,
                size: 24,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckInPage(),
                  ),
                );
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: TokopediaColors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(
                    color: TokopediaColors.textPrimary,
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
            color: TokopediaColors.textPrimary,
            size: 24,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
        ),
        
        SizedBox(width: isMobile ? 8 : 16),
      ],
    );
  }

  Widget _buildBody(bool isMobile, bool isTablet, bool isDesktop, double width) {
    // Hitung cross axis count berdasarkan lebar layar
    int crossAxisCount;
    double childAspectRatio;
    double horizontalPadding;
    
    if (isMobile) {
      crossAxisCount = 2;
      childAspectRatio = 0.54;
      horizontalPadding = 12;
    } else if (isTablet) {
      crossAxisCount = 3;
      childAspectRatio = 0.60;
      horizontalPadding = 24;
    } else {
      // Desktop - batasi lebar konten
      crossAxisCount = width > 1600 ? 6 : 5;
      childAspectRatio = 0.65;
      horizontalPadding = 0;
    }

    Widget content = CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildBannerSection(isMobile, isTablet, isDesktop)),
        SliverToBoxAdapter(child: _buildCategoriesSection(isMobile, isTablet)),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding + 16,
              20,
              horizontalPadding + 16,
              12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rekomendasi Untukmu',
                  style: TextStyle(
                    color: TokopediaColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Lihat Semua',
                    style: TextStyle(
                      color: TokopediaColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding + 12),
          sliver: SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildProductCard(_products[index], isMobile);
              },
              childCount: _products.length,
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
      ],
    );

    // Untuk desktop, batasi lebar konten di tengah
    if (isDesktop) {
      return Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: content,
        ),
      );
    }

    return content;
  }

  Widget _buildBannerSection(bool isMobile, bool isTablet, bool isDesktop) {
    double bannerHeight;
    double horizontalMargin;
    
    if (isMobile) {
      bannerHeight = 160;
      horizontalMargin = 16;
    } else if (isTablet) {
      bannerHeight = 200;
      horizontalMargin = 24;
    } else {
      bannerHeight = 280;
      horizontalMargin = 0;
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          constraints: isDesktop 
              ? const BoxConstraints(maxWidth: 1400) 
              : null,
          child: SizedBox(
            height: bannerHeight,
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
                  imageUrl: _bannerData[index]['imageUrl'] as String,
                  gradient: _bannerData[index]['gradient'] as LinearGradient,
                  title: _bannerData[index]['title'] as String,
                  subtitle: _bannerData[index]['subtitle'] as String,
                  horizontalMargin: horizontalMargin,
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
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
                    ? TokopediaColors.primary
                    : TokopediaColors.border,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBannerItem({
    required String imageUrl,
    required LinearGradient gradient,
    required String title,
    required String subtitle,
    required double horizontalMargin,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: _buildImageOrGradient(imageUrl, gradient),
      ),
    );
  }

  Widget _buildImageOrGradient(String imageUrl, LinearGradient gradient) {
    return Image.asset(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          decoration: BoxDecoration(gradient: gradient),
        );
      },
    );
  }

  Widget _buildCategoriesSection(bool isMobile, bool isTablet) {
    final categories = [
      {
        'icon': Icons.flash_on,
        'label': 'Flash Sale',
        'color': TokopediaColors.orange,
      },
      {
        'icon': Icons.local_shipping,
        'label': 'Gratis Ongkir',
        'color': TokopediaColors.primary,
      },
      {
        'icon': Icons.card_giftcard,
        'label': 'Voucher',
        'color': TokopediaColors.red,
      },
      {'icon': Icons.stars, 'label': 'Top Up', 'color': Colors.blue},
    ];

    double iconSize = isMobile ? 56 : (isTablet ? 64 : 72);
    double iconInnerSize = isMobile ? 28 : (isTablet ? 32 : 36);

    return Container(
      color: TokopediaColors.cardBackground,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((cat) {
          return Column(
            children: [
              Container(
                width: iconSize,
                height: iconSize,
                decoration: BoxDecoration(
                  color: (cat['color'] as Color).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: cat['color'] as Color,
                  size: iconInnerSize,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cat['label'] as String,
                style: TextStyle(
                  color: TokopediaColors.textPrimary,
                  fontSize: isMobile ? 12 : 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildProductCard(Product product, bool isMobile) {
    double imageHeight = isMobile ? 220 : 240;
    
    return Container(
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: TokopediaColors.border, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Stack(
            children: [
              Container(
                height: imageHeight,
                decoration: const BoxDecoration(
                  color: TokopediaColors.searchBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: Image.asset(
                    product.imageUrl,
                    width: double.infinity,
                    height: imageHeight,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.image_outlined,
                          size: 80,
                          color: TokopediaColors.textTertiary,
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Discount Badge
              if (product.discount.isNotEmpty)
                Positioned(
                  top: 8,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: const BoxDecoration(
                      color: TokopediaColors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      ),
                    ),
                    child: Text(
                      product.discount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.price,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (product.originalPrice.isNotEmpty)
                    Text(
                      product.originalPrice,
                      style: const TextStyle(
                        color: TokopediaColors.textTertiary,
                        fontSize: 11,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: TokopediaColors.yellow,
                        size: 14,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toString(),
                        style: const TextStyle(
                          color: TokopediaColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Container(
                        width: 2,
                        height: 2,
                        decoration: const BoxDecoration(
                          color: TokopediaColors.textTertiary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${product.sold} terjual',
                          style: const TextStyle(
                            color: TokopediaColors.textSecondary,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: TokopediaColors.textTertiary,
                        size: 12,
                      ),
                      const SizedBox(width: 2),
                      Expanded(
                        child: Text(
                          product.location,
                          style: const TextStyle(
                            color: TokopediaColors.textSecondary,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      if (product.badge.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: TokopediaColors.primary.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(3),
                            border: Border.all(
                              color: TokopediaColors.primary.withOpacity(0.3),
                              width: 0.5,
                            ),
                          ),
                          child: Text(
                            product.badge,
                            style: const TextStyle(
                              color: TokopediaColors.primary,
                              fontSize: 9,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      if (product.isFreeShipping) ...[
                        if (product.badge.isNotEmpty) const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: TokopediaColors.orange.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.local_shipping,
                                color: TokopediaColors.orange,
                                size: 10,
                              ),
                              SizedBox(width: 2),
                              Text(
                                'Gratis',
                                style: TextStyle(
                                  color: TokopediaColors.orange,
                                  fontSize: 9,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}