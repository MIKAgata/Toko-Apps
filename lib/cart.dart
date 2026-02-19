import 'package:flutter/material.dart';
import 'home_page.dart';
// import 'setting.dart';
// import 'profile_page.dart';
// import 'toko.dart';

/// Tokopedia Color Palette - Dark Mode
class TokopediaColors {
  static const Color primary = Color(0xFF42B549);
  static const Color primaryLight = Color(0xFF5BC862);
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

/// Cart Item Model
class CartItem {
  final String id;
  final String name;
  final String price;
  final String originalPrice;
  final String imageUrl;
  final String variant;
  final String seller;
  int quantity;
  bool isSelected;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
    required this.variant,
    required this.seller,
    this.quantity = 1,
    this.isSelected = true,
  });

  int get priceValue => int.parse(price.replaceAll(RegExp(r'[^0-9]'), ''));
  int get totalPrice => priceValue * quantity;
}

class CheckInPage extends StatefulWidget {
  const CheckInPage({super.key});

  @override
  State<CheckInPage> createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  bool _selectAll = true;
  // String _voucherCode = '';

  // Dummy Cart Items
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: 'iPhone 15 Pro Max 256GB Garansi Resmi iBox Indonesia',
      price: '18999000',
      originalPrice: '21999000',
      imageUrl: '',
      variant: 'Warna: Natural Titanium',
      seller: 'iBox Official Store',
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Sony WH-1000XM5 Wireless Noise Cancelling Headphones',
      price: '4299000',
      originalPrice: '5499000',
      imageUrl: '',
      variant: 'Warna: Black',
      seller: 'Sony Official Store',
      quantity: 2,
    ),
    CartItem(
      id: '3',
      name: 'Apple AirPods Pro 2nd Generation USB-C Original',
      price: '3499000',
      originalPrice: '3999000',
      imageUrl: '',
      variant: 'Model: USB-C',
      seller: 'Apple Authorized',
      quantity: 1,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      appBar: _buildAppBar(),
      body: _cartItems.isEmpty ? _buildEmptyCart() : _buildCartContent(),
      bottomNavigationBar: _cartItems.isEmpty ? null : _buildBottomBar(),
    );
  }

  /// Build AppBar
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: TokopediaColors.cardBackground,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.3),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: TokopediaColors.textPrimary,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Keranjang',
            style: TextStyle(
              color: TokopediaColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '${_cartItems.length} Produk',
            style: const TextStyle(
              color: TokopediaColors.textSecondary,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.delete_outline,
            color: TokopediaColors.textPrimary,
          ),
          onPressed: () => _showDeleteDialog(),
        ),
        IconButton(
          icon: const Icon(
            Icons.more_vert,
            color: TokopediaColors.textPrimary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  /// Build Empty Cart
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 120,
            color: TokopediaColors.textTertiary,
          ),
          const SizedBox(height: 24),
          const Text(
            'Wah, keranjang belanjamu kosong',
            style: TextStyle(
              color: TokopediaColors.textPrimary,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Yuk, isi dengan barang-barang impianmu!',
            style: TextStyle(
              color: TokopediaColors.textSecondary,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: TokopediaColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 48,
                vertical: 14,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Mulai Belanja',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build Cart Content
  Widget _buildCartContent() {
    return Column(
      children: [
        // Select All Section
        _buildSelectAllSection(),

        const Divider(
          height: 1,
          thickness: 1,
          color: TokopediaColors.divider,
        ),

        // Cart Items List
        Expanded(
          child: ListView(
            children: [
              // Cart Items
              ..._cartItems.map((item) => _buildCartItem(item)).toList(),

              const SizedBox(height: 8),

              // Voucher Section
              _buildVoucherSection(),

              const SizedBox(height: 8),

              // Shopping Protection
              _buildProtectionSection(),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ],
    );
  }

  /// Build Select All Section
  Widget _buildSelectAllSection() {
    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Checkbox(
            value: _selectAll,
            onChanged: (value) {
              setState(() {
                _selectAll = value ?? false;
                for (var item in _cartItems) {
                  item.isSelected = _selectAll;
                }
              });
            },
            activeColor: TokopediaColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const Text(
            'Pilih Semua',
            style: TextStyle(
              color: TokopediaColors.textPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: _getSelectedCount() > 0 ? () => _showDeleteDialog() : null,
            child: Text(
              'Hapus (${_getSelectedCount()})',
              style: TextStyle(
                color: _getSelectedCount() > 0
                    ? TokopediaColors.red
                    : TokopediaColors.textTertiary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build Cart Item
  Widget _buildCartItem(CartItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      color: TokopediaColors.cardBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Seller Name
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: Row(
              children: [
                const Icon(
                  Icons.store,
                  size: 16,
                  color: TokopediaColors.textSecondary,
                ),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    item.seller,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: TokopediaColors.primary.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: TokopediaColors.primary.withOpacity(0.3),
                      width: 0.5,
                    ),
                  ),
                  child: const Text(
                    'Official',
                    style: TextStyle(
                      color: TokopediaColors.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Divider(
            height: 1,
            thickness: 1,
            color: TokopediaColors.divider,
            indent: 16,
            endIndent: 16,
          ),

          // Product Item
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Checkbox
                Checkbox(
                  value: item.isSelected,
                  onChanged: (value) {
                    setState(() {
                      item.isSelected = value ?? false;
                      _updateSelectAll();
                    });
                  },
                  activeColor: TokopediaColors.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),

                // Product Image
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: TokopediaColors.searchBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: TokopediaColors.border,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: TokopediaColors.textTertiary,
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // Product Info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Name
                      Text(
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: TokopediaColors.textPrimary,
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 4),

                      // Variant
                      Text(
                        item.variant,
                        style: const TextStyle(
                          color: TokopediaColors.textSecondary,
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Price
                      Row(
                        children: [
                          Text(
                            'Rp${_formatPrice(item.price)}',
                            style: const TextStyle(
                              color: TokopediaColors.textPrimary,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Rp${_formatPrice(item.originalPrice)}',
                            style: const TextStyle(
                              color: TokopediaColors.textTertiary,
                              fontSize: 11,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Quantity Controls & Note
                      Row(
                        children: [
                          // Note Button
                          InkWell(
                            onTap: () => _showNoteDialog(item),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.edit_note,
                                  size: 18,
                                  color: TokopediaColors.textSecondary,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Tulis Catatan',
                                  style: TextStyle(
                                    color: TokopediaColors.textSecondary,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Spacer(),

                          // Quantity Control
                          _buildQuantityControl(item),
                        ],
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

  /// Build Quantity Control
  Widget _buildQuantityControl(CartItem item) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: TokopediaColors.border,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          // Decrease Button
          InkWell(
            onTap: () {
              if (item.quantity > 1) {
                setState(() {
                  item.quantity--;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              child: Icon(
                item.quantity > 1 ? Icons.remove : Icons.delete_outline,
                size: 18,
                color: item.quantity > 1
                    ? TokopediaColors.primary
                    : TokopediaColors.red,
              ),
            ),
          ),

          // Quantity Text
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                color: TokopediaColors.textPrimary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          // Increase Button
          InkWell(
            onTap: () {
              setState(() {
                item.quantity++;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.add,
                size: 18,
                color: TokopediaColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Build Voucher Section
  Widget _buildVoucherSection() {
    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Voucher Header
          Row(
            children: const [
              Icon(
                Icons.local_offer_outlined,
                color: TokopediaColors.orange,
                size: 20,
              ),
              SizedBox(width: 8),
              Text(
                'Voucher & Promo',
                style: TextStyle(
                  color: TokopediaColors.textPrimary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              Icon(
                Icons.chevron_right,
                color: TokopediaColors.textTertiary,
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Available Vouchers
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: TokopediaColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: TokopediaColors.primary.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: TokopediaColors.primary,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(
                    Icons.confirmation_number,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        '3 Voucher Tersedia',
                        style: TextStyle(
                          color: TokopediaColors.textPrimary,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Dapatkan diskon hingga Rp50.000',
                        style: TextStyle(
                          color: TokopediaColors.textSecondary,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: TokopediaColors.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Build Protection Section
  Widget _buildProtectionSection() {
    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.15),
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.verified_user,
              color: Colors.blue,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Proteksi Belanja',
                  style: TextStyle(
                    color: TokopediaColors.textPrimary,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Barang rusak? Uang kembali 100%',
                  style: TextStyle(
                    color: TokopediaColors.textSecondary,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.info_outline,
            color: TokopediaColors.textSecondary,
            size: 18,
          ),
        ],
      ),
    );
  }

  /// Build Bottom Bar
  Widget _buildBottomBar() {
    int total = _getSelectedTotal();
    int selectedCount = _getSelectedCount();

    return Container(
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Total Section
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Harga',
                      style: TextStyle(
                        color: TokopediaColors.textSecondary,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Rp${_formatPrice(total.toString())}',
                          style: const TextStyle(
                            color: TokopediaColors.textPrimary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          color: TokopediaColors.textSecondary,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 16),

              // Checkout Button
              ElevatedButton(
                onPressed: selectedCount > 0 ? () => _showCheckoutDialog() : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedCount > 0
                      ? TokopediaColors.primary
                      : TokopediaColors.border,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
                child: Text(
                  'Beli ($selectedCount)',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper Methods
  int _getSelectedCount() {
    return _cartItems.where((item) => item.isSelected).length;
  }

  int _getSelectedTotal() {
    return _cartItems
        .where((item) => item.isSelected)
        .fold(0, (sum, item) => sum + item.totalPrice);
  }

  void _updateSelectAll() {
    setState(() {
      _selectAll = _cartItems.every((item) => item.isSelected);
    });
  }

  String _formatPrice(String price) {
    final number = int.parse(price.replaceAll(RegExp(r'[^0-9]'), ''));
    return number.toString().replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]}.',
        );
  }

  /// Show Delete Dialog
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Hapus Produk',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin menghapus ${_getSelectedCount()} produk dari keranjang?',
          style: const TextStyle(
            color: TokopediaColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'BATAL',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _cartItems.removeWhere((item) => item.isSelected);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Produk berhasil dihapus'),
                  backgroundColor: TokopediaColors.primary,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'HAPUS',
              style: TextStyle(
                color: TokopediaColors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show Note Dialog
  void _showNoteDialog(CartItem item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Tulis Catatan',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: TextField(
          maxLines: 3,
          style: const TextStyle(color: TokopediaColors.textPrimary),
          decoration: InputDecoration(
            hintText: 'Contoh: Warna merah, ukuran XL',
            hintStyle: const TextStyle(color: TokopediaColors.textSecondary),
            filled: true,
            fillColor: TokopediaColors.searchBackground,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'BATAL',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Catatan berhasil disimpan'),
                  backgroundColor: TokopediaColors.primary,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'SIMPAN',
              style: TextStyle(
                color: TokopediaColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Show Checkout Dialog
  void _showCheckoutDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Checkout',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Fitur checkout sedang dalam pengembangan',
          style: TextStyle(
            color: TokopediaColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: TokopediaColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}