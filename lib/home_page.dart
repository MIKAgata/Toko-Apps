import 'package:flutter/material.dart';
import 'dart:async';
import 'profile_page.dart';
import 'cart.dart';
import 'setting.dart';
// import 'toko.dart';


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

/// Tokopedia Color Palette - Dark Mode
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
      'gradient': const LinearGradient(
        colors: [Color(0xFF42B549), Color(0xFF5BC862)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Flash Sale 12.12',
      'subtitle': 'Diskon hingga 90%',
    },
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFFFF6B00), Color(0xFFFF8A3D)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Gratis Ongkir',
      'subtitle': 'Min. belanja Rp 0',
    },
    {
      'gradient': const LinearGradient(
        colors: [Color(0xFF2196F3), Color(0xFF42A5F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      'title': 'Cashback 50%',
      'subtitle': 'Pakai OVO/GoPay',
    },
    {
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
      name: 'iPhone 15 Pro Max 256GB Garansi Resmi iBox Indonesia',
      price: 'Rp18.999.000',
      originalPrice: 'Rp21.999.000',
      discount: '13%',
      rating: 4.9,
      sold: 1250,
      location: 'Jakarta Pusat',
      imageUrl: '',
      isFreeShipping: true,
      badge: 'Power Merchant',
    ),
    Product(
      name: 'Samsung Galaxy S24 Ultra 12/256GB Garansi Resmi SEIN',
      price: 'Rp15.499.000',
      originalPrice: 'Rp17.999.000',
      discount: '14%',
      rating: 4.8,
      sold: 890,
      location: 'Tangerang',
      imageUrl: '',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Xiaomi 14 Pro 5G 12/512GB Snapdragon 8 Gen 3',
      price: 'Rp8.999.000',
      originalPrice: 'Rp10.499.000',
      discount: '14%',
      rating: 4.7,
      sold: 2340,
      location: 'Surabaya',
      imageUrl: '',
      isFreeShipping: true,
      badge: 'Top Seller',
    ),
    Product(
      name: 'MacBook Air M3 13 inch 8GB 256GB SSD Space Gray',
      price: 'Rp16.499.000',
      originalPrice: 'Rp18.999.000',
      discount: '13%',
      rating: 5.0,
      sold: 456,
      location: 'Jakarta Selatan',
      imageUrl: '',
      isFreeShipping: true,
      badge: 'Official Store',
    ),
    Product(
      name: 'Sony WH-1000XM5 Wireless Noise Cancelling Headphones',
      price: 'Rp4.299.000',
      originalPrice: 'Rp5.499.000',
      discount: '22%',
      rating: 4.9,
      sold: 3450,
      location: 'Bandung',
      imageUrl: '',
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
      imageUrl: '',
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
      imageUrl: '',
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
      imageUrl: '',
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
      backgroundColor: TokopediaColors.background,
      appBar: AppBar(
        backgroundColor: TokopediaColors.cardBackground,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
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
          const SizedBox(width: 8),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Banner Section
          SliverToBoxAdapter(child: _buildBannerSection()),

          // Categories Section
          SliverToBoxAdapter(child: _buildCategoriesSection()),

          // Section Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
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

          // Product Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.62,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildProductCard(_products[index]);
              }, childCount: _products.length),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }

  Widget _buildBannerSection() {
    return Column(
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 160,
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
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.3)],
              ),
            ),
          ),
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
                    fontWeight: FontWeight.w500,
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

  Widget _buildCategoriesSection() {
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

    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: categories.map((cat) {
          return Column(
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: (cat['color'] as Color).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  cat['icon'] as IconData,
                  color: cat['color'] as Color,
                  size: 28,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                cat['label'] as String,
                style: const TextStyle(
                  color: TokopediaColors.textPrimary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }


  Widget _buildProductCard(Product product) {
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
                height: 140,
                decoration: BoxDecoration(
                  color: TokopediaColors.searchBackground,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.image_outlined,
                    size: 60,
                    color: TokopediaColors.textTertiary,
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
                  // Product Name
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

                  // Location
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
                            children: [
                              Icon(
                                Icons.local_shipping,
                                color: TokopediaColors.orange,
                                size: 10,
                              ),
                              const SizedBox(width: 2),
                              const Text(
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
