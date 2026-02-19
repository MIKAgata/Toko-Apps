import 'package:flutter/material.dart';
import 'home_page.dart';
import 'cart.dart';
import 'profile_page.dart';
import 'toko.dart';

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

class Settingpage extends StatelessWidget {
  const Settingpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      appBar: AppBar(
        backgroundColor: TokopediaColors.cardBackground,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.help_outline,
              color: TokopediaColors.textPrimary,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Pusat Bantuan'),
                  backgroundColor: TokopediaColors.cardBackground,
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          // Header Section - User Info
          _buildUserSection(context),

          const SizedBox(height: 8),

          // Navigation Quick Access
          _buildSectionTitle('Akses Cepat'),
          _buildQuickAccessGrid(context),

          const SizedBox(height: 8),


          _buildSectionTitle('Akun Saya'),
          _buildSettingItem(
            icon: Icons.person_outline,
            title: 'Profil',
            subtitle: 'Ubah data diri Anda',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.location_on_outlined,
            title: 'Alamat',
            subtitle: 'Atur alamat pengiriman',
            onTap: () {
              _showComingSoon(context, 'Pengaturan Alamat');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.payment,
            title: 'Pembayaran',
            subtitle: 'Rekening bank & e-wallet',
            onTap: () {
              _showComingSoon(context, 'Pengaturan Pembayaran');
            },
          ),

          const SizedBox(height: 8),

          // Notification Settings
          _buildSectionTitle('Notifikasi'),
          _buildSettingItem(
            icon: Icons.notifications_outlined,
            title: 'Pengaturan Notifikasi',
            subtitle: 'Atur notifikasi yang Anda terima',
            trailing: Switch(
              value: true,
              activeColor: TokopediaColors.primary,
              onChanged: (value) {},
            ),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.email_outlined,
            title: 'Notifikasi Email',
            subtitle: 'Terima promo via email',
            trailing: Switch(
              value: false,
              activeColor: TokopediaColors.primary,
              onChanged: (value) {},
            ),
          ),

          const SizedBox(height: 8),

          // Privacy & Security
          _buildSectionTitle('Privasi & Keamanan'),
          _buildSettingItem(
            icon: Icons.lock_outline,
            title: 'Ubah Password',
            subtitle: 'Ganti password akun Anda',
            onTap: () {
              _showComingSoon(context, 'Ubah Password');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.fingerprint,
            title: 'Keamanan Akun',
            subtitle: 'PIN, sidik jari, verifikasi 2 langkah',
            onTap: () {
              _showComingSoon(context, 'Keamanan Akun');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.privacy_tip_outlined,
            title: 'Privasi',
            subtitle: 'Pengaturan privasi data',
            onTap: () {
              _showComingSoon(context, 'Pengaturan Privasi');
            },
          ),

          const SizedBox(height: 8),

          // App Settings
          _buildSectionTitle('Pengaturan Aplikasi'),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Bahasa',
            subtitle: 'Indonesia',
            onTap: () {
              _showComingSoon(context, 'Pengaturan Bahasa');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.dark_mode_outlined,
            title: 'Mode Gelap',
            subtitle: 'Aktif',
            trailing: Switch(
              value: true,
              activeColor: TokopediaColors.primary,
              onChanged: (value) {},
            ),
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.data_usage,
            title: 'Hemat Data',
            subtitle: 'Kurangi penggunaan data',
            trailing: Switch(
              value: false,
              activeColor: TokopediaColors.primary,
              onChanged: (value) {},
            ),
          ),

          const SizedBox(height: 8),

          // Help & About
          _buildSectionTitle('Bantuan & Tentang'),
          _buildSettingItem(
            icon: Icons.help_outline,
            title: 'Pusat Bantuan',
            subtitle: 'FAQ dan panduan',
            onTap: () {
              _showComingSoon(context, 'Pusat Bantuan');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.chat_bubble_outline,
            title: 'Hubungi Kami',
            subtitle: 'Chat dengan customer service',
            onTap: () {
              _showComingSoon(context, 'Hubungi Kami');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.star_outline,
            title: 'Beri Rating',
            subtitle: 'Rating aplikasi di Play Store',
            onTap: () {
              _showComingSoon(context, 'Beri Rating');
            },
          ),
          _buildDivider(),
          _buildSettingItem(
            icon: Icons.info_outline,
            title: 'Tentang Aplikasi',
            subtitle: 'Versi 1.0.0',
            onTap: () {
              _showAboutDialog(context);
            },
          ),

          const SizedBox(height: 16),

          // Logout Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              onPressed: () {
                _showLogoutDialog(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: TokopediaColors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Keluar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Build User Section
  Widget _buildUserSection(BuildContext context) {
    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [TokopediaColors.primary, TokopediaColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: TokopediaColors.primary.withOpacity(0.3),
                width: 2,
              ),
            ),
            child: const Center(
              child: Text(
                'U',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // User Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Username',
                  style: TextStyle(
                    color: TokopediaColors.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
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
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.verified,
                            color: TokopediaColors.primary,
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Member Gold',
                            style: TextStyle(
                              color: TokopediaColors.primary,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Text(
                  'user@email.com',
                  style: TextStyle(
                    color: TokopediaColors.textSecondary,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          // Arrow
          const Icon(
            Icons.chevron_right,
            color: TokopediaColors.textTertiary,
          ),
        ],
      ),
    );
  }

  /// Build Quick Access Grid
  Widget _buildQuickAccessGrid(BuildContext context) {
    final quickAccess = [
      {
        'icon': Icons.home_outlined,
        'label': 'Home',
        'color': TokopediaColors.primary,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        },
      },
      {
        'icon': Icons.shopping_cart_outlined,
        'label': 'CheckIn',
        'color': TokopediaColors.orange,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CheckInPage()),
          );
        },
      },
      {
        'icon': Icons.store_outlined,
        'label': 'Toko',
        'color': Colors.blue,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Toko()),
          );
        },
      },
      {
        'icon': Icons.person_outline,
        'label': 'Profile',
        'color': Colors.purple,
        'onTap': () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfilePage()),
          );
        },
      },
    ];

    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: quickAccess.map((item) {
          return InkWell(
            onTap: item['onTap'] as VoidCallback,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 80,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: (item['color'] as Color).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      item['icon'] as IconData,
                      color: item['color'] as Color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Build Section Title
  Widget _buildSectionTitle(String title) {
    return Container(
      color: TokopediaColors.background,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          color: TokopediaColors.textSecondary,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  /// Build Setting Item
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    Widget? trailing,
  }) {
    return Container(
      color: TokopediaColors.cardBackground,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              // Icon
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: TokopediaColors.searchBackground,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  icon,
                  color: TokopediaColors.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 16),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: TokopediaColors.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: TokopediaColors.textSecondary,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              // Trailing
              if (trailing != null)
                trailing
              else
                const Icon(
                  Icons.chevron_right,
                  color: TokopediaColors.textTertiary,
                ),
            ],
          ),
        ),
      ),
    );
  }

  /// Build Divider
  Widget _buildDivider() {
    return Container(
      color: TokopediaColors.cardBackground,
      padding: const EdgeInsets.only(left: 72),
      child: const Divider(
        height: 1,
        thickness: 1,
        color: TokopediaColors.divider,
      ),
    );
  }

  /// Show Coming Soon
  void _showComingSoon(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Segera Hadir',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Fitur $feature sedang dalam pengembangan',
          style: const TextStyle(
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

  /// Show About Dialog
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [TokopediaColors.primary, TokopediaColors.primaryLight],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.shopping_bag,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'Tentang',
              style: TextStyle(
                color: TokopediaColors.textPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Tokopedia Clone',
              style: TextStyle(
                color: TokopediaColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Versi: 1.0.0',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Build: 100',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontSize: 14,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aplikasi e-commerce dengan UI/UX mirip Tokopedia',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'TUTUP',
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

  /// Show Logout Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Keluar',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari akun?',
          style: TextStyle(
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
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Berhasil keluar'),
                  backgroundColor: TokopediaColors.primary,
                  duration: Duration(seconds: 2),
                ),
              );
            },
            child: const Text(
              'KELUAR',
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
}