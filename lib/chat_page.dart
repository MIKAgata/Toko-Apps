import 'package:flutter/material.dart';
import 'home_page.dart';
// import 'chat_page.dart';
import 'setting.dart';
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

/// Chat Model
class ChatMessage {
  final String id;
  final String sellerName;
  final String sellerAvatar;
  final String lastMessage;
  final String timestamp;
  final int unreadCount;
  final bool isOnline;
  final bool isOfficial;
  final String productName;
  final String productImage;
  final String productPrice;

  ChatMessage({
    required this.id,
    required this.sellerName,
    required this.sellerAvatar,
    required this.lastMessage,
    required this.timestamp,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isOfficial = false,
    this.productName = '',
    this.productImage = '',
    this.productPrice = '',
  });
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  // Dummy Chat Data
  final List<ChatMessage> _chats = [
    ChatMessage(
      id: '1',
      sellerName: 'iBox Official Store',
      sellerAvatar: '',
      lastMessage: 'Terima kasih sudah berbelanja. Pesanan akan segera kami proses 😊',
      timestamp: '10:30',
      unreadCount: 2,
      isOnline: true,
      isOfficial: true,
      productName: 'iPhone 15 Pro Max 256GB',
      productImage: '',
      productPrice: 'Rp18.999.000',
    ),
    ChatMessage(
      id: '2',
      sellerName: 'Sony Official Store',
      sellerAvatar: '',
      lastMessage: 'Stok headphone hitam masih ready kak. Langsung checkout aja ya',
      timestamp: 'Kemarin',
      unreadCount: 0,
      isOnline: false,
      isOfficial: true,
      productName: 'Sony WH-1000XM5',
      productImage: '',
      productPrice: 'Rp4.299.000',
    ),
    ChatMessage(
      id: '3',
      sellerName: 'Gadget Store Jakarta',
      sellerAvatar: '',
      lastMessage: 'Anda: Oke siap, terima kasih infonya',
      timestamp: '2 hari lalu',
      unreadCount: 0,
      isOnline: false,
      isOfficial: false,
      productName: 'AirPods Pro 2nd Gen',
      productImage: '',
      productPrice: 'Rp3.499.000',
    ),
    ChatMessage(
      id: '4',
      sellerName: 'Samsung Official Store',
      sellerAvatar: '',
      lastMessage: 'Produk sudah dikirim ya kak. Nomor resi: JNE1234567890',
      timestamp: '3 hari lalu',
      unreadCount: 1,
      isOnline: true,
      isOfficial: true,
      productName: 'Samsung Galaxy S24 Ultra',
      productImage: '',
      productPrice: 'Rp15.499.000',
    ),
    ChatMessage(
      id: '5',
      sellerName: 'Tech Accessories Hub',
      sellerAvatar: '',
      lastMessage: 'Garansi resmi 1 tahun kak, bisa claim di service center',
      timestamp: '1 minggu lalu',
      unreadCount: 0,
      isOnline: false,
      isOfficial: false,
      productName: 'Logitech MX Master 3S',
      productImage: '',
      productPrice: 'Rp1.399.000',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalUnread = _chats.fold(0, (sum, chat) => sum + chat.unreadCount);

    return Scaffold(
      backgroundColor: TokopediaColors.background,
      appBar: AppBar(
        backgroundColor: TokopediaColors.cardBackground,
        elevation: 2,
        shadowColor: Colors.black.withOpacity(0.3),
        title: const Text(
          'Chat',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // Notification Bell
          IconButton(
            icon: Badge(
              label: Text('$totalUnread'),
              backgroundColor: TokopediaColors.red,
              isLabelVisible: totalUnread > 0,
              child: const Icon(
                Icons.notifications_outlined,
                color: TokopediaColors.textPrimary,
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Notifikasi'),
                  backgroundColor: TokopediaColors.cardBackground,
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          // Settings
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: TokopediaColors.textPrimary,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Settingpage()),
              );
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(104),
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: TokopediaColors.searchBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: TokopediaColors.border,
                      width: 1,
                    ),
                  ),
                  child: TextField(
                    controller: _searchController,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 14,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'Cari chat...',
                      hintStyle: TextStyle(
                        color: TokopediaColors.textSecondary,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: TokopediaColors.textSecondary,
                        size: 20,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                    ),
                  ),
                ),
              ),

              // Tab Bar
              Container(
                color: TokopediaColors.cardBackground,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: TokopediaColors.primary,
                  indicatorWeight: 3,
                  labelColor: TokopediaColors.primary,
                  unselectedLabelColor: TokopediaColors.textSecondary,
                  labelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Chat'),
                          if (totalUnread > 0) ...[
                            const SizedBox(width: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: TokopediaColors.red,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '$totalUnread',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const Tab(text: 'Diskusi'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Chat Tab
          _buildChatList(),
          // Diskusi Tab
          _buildDiskusiList(),
        ],
      ),
    );
  }

  /// Build Chat List
  Widget _buildChatList() {
    if (_chats.isEmpty) {
      return _buildEmptyState(
        icon: Icons.chat_bubble_outline,
        title: 'Belum ada chat',
        subtitle: 'Chat dengan penjual akan muncul di sini',
      );
    }

    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        return _buildChatItem(_chats[index]);
      },
    );
  }

  /// Build Chat Item
  Widget _buildChatItem(ChatMessage chat) {
    bool isFromUser = chat.lastMessage.startsWith('Anda:');

    return InkWell(
      onTap: () => _openChatDetail(chat),
      onLongPress: () => _showChatOptions(chat),
      child: Container(
        color: TokopediaColors.cardBackground,
        margin: const EdgeInsets.only(bottom: 1),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: TokopediaColors.searchBackground,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: chat.isOnline
                          ? TokopediaColors.primary
                          : TokopediaColors.border,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      chat.sellerName[0].toUpperCase(),
                      style: const TextStyle(
                        color: TokopediaColors.textPrimary,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                // Online Indicator
                if (chat.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: TokopediaColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: TokopediaColors.cardBackground,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // Chat Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Seller Name & Badge
                  Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                chat.sellerName,
                                style: const TextStyle(
                                  color: TokopediaColors.textPrimary,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (chat.isOfficial) ...[
                              const SizedBox(width: 6),
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
                                child: const Text(
                                  'Official',
                                  style: TextStyle(
                                    color: TokopediaColors.primary,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Timestamp
                      Text(
                        chat.timestamp,
                        style: TextStyle(
                          color: chat.unreadCount > 0
                              ? TokopediaColors.primary
                              : TokopediaColors.textTertiary,
                          fontSize: 11,
                          fontWeight: chat.unreadCount > 0
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  // Last Message
                  Row(
                    children: [
                      if (isFromUser)
                        const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(
                            Icons.done_all,
                            size: 16,
                            color: TokopediaColors.primary,
                          ),
                        ),
                      Expanded(
                        child: Text(
                          isFromUser
                              ? chat.lastMessage.replaceFirst('Anda: ', '')
                              : chat.lastMessage,
                          style: TextStyle(
                            color: chat.unreadCount > 0
                                ? TokopediaColors.textPrimary
                                : TokopediaColors.textSecondary,
                            fontSize: 13,
                            fontWeight: chat.unreadCount > 0
                                ? FontWeight.w500
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Unread Badge
                      if (chat.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 3,
                          ),
                          decoration: const BoxDecoration(
                            color: TokopediaColors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount > 99
                                ? '99+'
                                : '${chat.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Product Info
                  if (chat.productName.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: TokopediaColors.searchBackground,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: TokopediaColors.border,
                          width: 0.5,
                        ),
                      ),
                      child: Row(
                        children: [
                          // Product Image
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: TokopediaColors.background,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Icon(
                              Icons.image_outlined,
                              size: 20,
                              color: TokopediaColors.textTertiary,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  chat.productName,
                                  style: const TextStyle(
                                    color: TokopediaColors.textPrimary,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  chat.productPrice,
                                  style: const TextStyle(
                                    color: TokopediaColors.textSecondary,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Build Diskusi List
  Widget _buildDiskusiList() {
    return _buildEmptyState(
      icon: Icons.forum_outlined,
      title: 'Belum ada diskusi',
      subtitle: 'Diskusi produk akan muncul di sini',
    );
  }

  /// Build Empty State
  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: TokopediaColors.cardBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                size: 60,
                color: TokopediaColors.textTertiary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              title,
              style: const TextStyle(
                color: TokopediaColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: TokopediaColors.textSecondary,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
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
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Belanja Sekarang',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Open Chat Detail
  void _openChatDetail(ChatMessage chat) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatDetailPage(chat: chat),
      ),
    );
  }

  /// Show Chat Options
  void _showChatOptions(ChatMessage chat) {
    showModalBottomSheet(
      context: context,
      backgroundColor: TokopediaColors.cardBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: TokopediaColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            _buildBottomSheetItem(
              icon: Icons.notifications_off_outlined,
              title: 'Matikan Notifikasi',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifikasi dimatikan'),
                    backgroundColor: TokopediaColors.cardBackground,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            _buildBottomSheetItem(
              icon: Icons.push_pin_outlined,
              title: 'Pin Chat',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Chat di-pin'),
                    backgroundColor: TokopediaColors.cardBackground,
                    duration: Duration(seconds: 2),
                  ),
                );
              },
            ),
            _buildBottomSheetItem(
              icon: Icons.delete_outline,
              title: 'Hapus Chat',
              titleColor: TokopediaColors.red,
              onTap: () {
                Navigator.pop(context);
                _showDeleteConfirmation(chat);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSheetItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? titleColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: titleColor ?? TokopediaColors.textPrimary,
              size: 24,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: titleColor ?? TokopediaColors.textPrimary,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Show Delete Confirmation
  void _showDeleteConfirmation(ChatMessage chat) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: TokopediaColors.cardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: const Text(
          'Hapus Chat',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Apakah Anda yakin ingin menghapus chat dengan ${chat.sellerName}?',
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
                _chats.remove(chat);
              });
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Chat berhasil dihapus'),
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
}

/// Chat Detail Page
class ChatDetailPage extends StatefulWidget {
  final ChatMessage chat;

  const ChatDetailPage({super.key, required this.chat});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
    // Add dummy messages
    _messages.addAll([
      {
        'text': 'Halo kak, ada yang bisa dibantu?',
        'isFromUser': false,
        'time': '09:00',
      },
      {
        'text': 'Halo, produknya ready stock?',
        'isFromUser': true,
        'time': '09:15',
      },
      {
        'text': widget.chat.lastMessage,
        'isFromUser': false,
        'time': widget.chat.timestamp,
      },
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      appBar: AppBar(
        backgroundColor: TokopediaColors.cardBackground,
        elevation: 2,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: TokopediaColors.textPrimary),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: TokopediaColors.searchBackground,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.chat.isOnline
                      ? TokopediaColors.primary
                      : TokopediaColors.border,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  widget.chat.sellerName[0].toUpperCase(),
                  style: const TextStyle(
                    color: TokopediaColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          widget.chat.sellerName,
                          style: const TextStyle(
                            color: TokopediaColors.textPrimary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (widget.chat.isOfficial) ...[
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.verified,
                          color: TokopediaColors.primary,
                          size: 14,
                        ),
                      ],
                    ],
                  ),
                  Text(
                    widget.chat.isOnline ? 'Online' : 'Offline',
                    style: TextStyle(
                      color: widget.chat.isOnline
                          ? TokopediaColors.primary
                          : TokopediaColors.textSecondary,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: TokopediaColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(
                  message['text'],
                  message['isFromUser'],
                  message['time'],
                );
              },
            ),
          ),

          // Input Area
          Container(
            decoration: BoxDecoration(
              color: TokopediaColors.cardBackground,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.add_circle_outline,
                        color: TokopediaColors.textSecondary,
                      ),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: TokopediaColors.searchBackground,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: TextField(
                          controller: _messageController,
                          style: const TextStyle(
                            color: TokopediaColors.textPrimary,
                          ),
                          decoration: const InputDecoration(
                            hintText: 'Tulis pesan...',
                            hintStyle: TextStyle(
                              color: TokopediaColors.textSecondary,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: TokopediaColors.primary,
                      ),
                      onPressed: () {
                        if (_messageController.text.isNotEmpty) {
                          setState(() {
                            _messages.add({
                              'text': _messageController.text,
                              'isFromUser': true,
                              'time': 'Baru saja',
                            });
                            _messageController.clear();
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(String text, bool isFromUser, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isFromUser) ...[
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: TokopediaColors.searchBackground,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.chat.sellerName[0].toUpperCase(),
                  style: const TextStyle(
                    color: TokopediaColors.textPrimary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isFromUser
                    ? TokopediaColors.primary
                    : TokopediaColors.cardBackground,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(isFromUser ? 16 : 4),
                  bottomRight: Radius.circular(isFromUser ? 4 : 16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      color: isFromUser
                          ? Colors.white
                          : TokopediaColors.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      color: isFromUser
                          ? Colors.white.withOpacity(0.7)
                          : TokopediaColors.textTertiary,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isFromUser) const SizedBox(width: 8),
        ],
      ),
    );
  }
}