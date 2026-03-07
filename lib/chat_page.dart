import 'package:flutter/material.dart';
import 'home_page.dart';
import 'setting.dart';

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
  
  // WhatsApp-like colors
  static const Color chatBubbleReceived = Color(0xFF1F2C33);
  static const Color chatBubbleSent = Color(0xFF005C4B);
}

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

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _searchController = TextEditingController();
  ChatMessage? _selectedChat;

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
      lastMessage: 'Oke siap, terima kasih infonya',
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
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 600;
        final isTablet = width >= 600 && width < 1024;
        final isDesktop = width >= 1024;

        if (isDesktop) {
          return _buildDesktopLayout();
        } else if (isTablet) {
          return _buildTabletLayout();
        } else {
          return _buildMobileLayout();
        }
      },
    );
  }

  /// Mobile Layout (WhatsApp Mobile)
  Widget _buildMobileLayout() {
    if (_selectedChat != null) {
      return ChatDetailPage(
        chat: _selectedChat!,
        onBack: () {
          setState(() {
            _selectedChat = null;
          });
        },
      );
    }

    int totalUnread = _chats.fold(0, (sum, chat) => sum + chat.unreadCount);

    return Scaffold(
      backgroundColor: TokopediaColors.background,
      appBar: AppBar(
        backgroundColor: TokopediaColors.cardBackground,
        elevation: 1,
        title: const Text(
          'Chats',
          style: TextStyle(
            color: TokopediaColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: TokopediaColors.textPrimary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search, color: TokopediaColors.textPrimary),
            onPressed: () {
              // Show search
            },
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: TokopediaColors.textPrimary),
            color: TokopediaColors.cardBackground,
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'settings',
                child: Text('Settings', style: TextStyle(color: TokopediaColors.textPrimary)),
              ),
            ],
            onSelected: (value) {
              if (value == 'settings') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settingpage()),
                );
              }
            },
          ),
        ],
      ),
      body: _buildChatList(isMobile: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: TokopediaColors.primary,
        child: const Icon(Icons.chat, color: Colors.white),
      ),
    );
  }

  /// Tablet Layout (WhatsApp iPad - Split View)
  Widget _buildTabletLayout() {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      body: Row(
        children: [
          // Chat List - 40% width
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              children: [
                _buildTabletAppBar(),
                Expanded(child: _buildChatList(isTablet: true)),
              ],
            ),
          ),
          
          // Divider
          Container(width: 1, color: TokopediaColors.divider),
          
          // Chat Detail - 60% width
          Expanded(
            child: _selectedChat != null
                ? ChatDetailPage(chat: _selectedChat!, isTablet: true)
                : _buildEmptyChatArea(),
          ),
        ],
      ),
    );
  }

  /// Desktop Layout (WhatsApp Web)
  Widget _buildDesktopLayout() {
    return Scaffold(
      backgroundColor: TokopediaColors.background,
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1600),
          child: Row(
            children: [
              // Sidebar - Chat List
              Container(
                width: 420,
                decoration: BoxDecoration(
                  color: TokopediaColors.cardBackground,
                  border: Border(
                    right: BorderSide(color: TokopediaColors.divider, width: 1),
                  ),
                ),
                child: Column(
                  children: [
                    _buildDesktopAppBar(),
                    _buildSearchBar(),
                    Expanded(child: _buildChatList(isDesktop: true)),
                  ],
                ),
              ),
              
              // Main Chat Area
              Expanded(
                child: _selectedChat != null
                    ? ChatDetailPage(chat: _selectedChat!, isDesktop: true)
                    : _buildEmptyChatArea(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTabletAppBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        border: Border(bottom: BorderSide(color: TokopediaColors.divider)),
      ),
      child: Row(
        children: [
          const Text(
            'Chats',
            style: TextStyle(
              color: TokopediaColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_vert, color: TokopediaColors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopAppBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        border: Border(bottom: BorderSide(color: TokopediaColors.divider)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: TokopediaColors.primary,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(Icons.person, color: Colors.white, size: 24),
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.donut_large, color: TokopediaColors.textSecondary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat, color: TokopediaColors.textSecondary),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: TokopediaColors.textSecondary),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        border: Border(bottom: BorderSide(color: TokopediaColors.divider)),
      ),
      child: Container(
        height: 36,
        decoration: BoxDecoration(
          color: TokopediaColors.searchBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: TextField(
          controller: _searchController,
          style: const TextStyle(color: TokopediaColors.textPrimary, fontSize: 14),
          decoration: const InputDecoration(
            hintText: 'Search or start new chat',
            hintStyle: TextStyle(color: TokopediaColors.textSecondary, fontSize: 14),
            prefixIcon: Icon(Icons.search, color: TokopediaColors.textSecondary, size: 20),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
    );
  }

  Widget _buildChatList({
    bool isMobile = false,
    bool isTablet = false,
    bool isDesktop = false,
  }) {
    if (_chats.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        final isSelected = _selectedChat?.id == chat.id;
        
        return _buildChatItem(
          chat,
          isSelected: isSelected,
          isMobile: isMobile,
          isTablet: isTablet,
          isDesktop: isDesktop,
        );
      },
    );
  }

  Widget _buildChatItem(
    ChatMessage chat, {
    bool isSelected = false,
    bool isMobile = false,
    bool isTablet = false,
    bool isDesktop = false,
  }) {
    bool isFromUser = chat.lastMessage.startsWith('Anda:');

    return InkWell(
      onTap: () {
        setState(() {
          _selectedChat = chat;
        });
      },
      child: Container(
        color: isSelected ? TokopediaColors.searchBackground : TokopediaColors.cardBackground,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // Avatar
            Stack(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: TokopediaColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      chat.sellerName[0].toUpperCase(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                if (chat.isOnline)
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        color: TokopediaColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: TokopediaColors.cardBackground,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(width: 12),

            // Chat Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          chat.sellerName,
                          style: TextStyle(
                            color: TokopediaColors.textPrimary,
                            fontSize: 16,
                            fontWeight: chat.unreadCount > 0 
                                ? FontWeight.w600 
                                : FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        chat.timestamp,
                        style: TextStyle(
                          color: chat.unreadCount > 0
                              ? TokopediaColors.primary
                              : TokopediaColors.textTertiary,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
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
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (chat.unreadCount > 0) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: const BoxDecoration(
                            color: TokopediaColors.primary,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
                          child: Center(
                            child: Text(
                              chat.unreadCount > 99 ? '99+' : '${chat.unreadCount}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.chat_bubble_outline,
            size: 100,
            color: TokopediaColors.textTertiary,
          ),
          const SizedBox(height: 24),
          const Text(
            'No chats yet',
            style: TextStyle(
              color: TokopediaColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Start chatting with sellers',
            style: TextStyle(
              color: TokopediaColors.textSecondary,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyChatArea() {
    return Container(
      color: TokopediaColors.background,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                color: TokopediaColors.cardBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.chat_bubble_outline,
                size: 120,
                color: TokopediaColors.textTertiary,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Tokopedia Chat for Desktop',
              style: TextStyle(
                color: TokopediaColors.textPrimary,
                fontSize: 32,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Send and receive messages with sellers',
              style: TextStyle(
                color: TokopediaColors.textSecondary,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Chat Detail Page
class ChatDetailPage extends StatefulWidget {
  final ChatMessage chat;
  final VoidCallback? onBack;
  final bool isTablet;
  final bool isDesktop;

  const ChatDetailPage({
    super.key,
    required this.chat,
    this.onBack,
    this.isTablet = false,
    this.isDesktop = false,
  });

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, dynamic>> _messages = [];

  @override
  void initState() {
    super.initState();
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
      appBar: _buildAppBar(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://user-images.githubusercontent.com/15075759/28719144-86dc0f70-73b1-11e7-911d-60d70fcded21.png',
                  ),
                  opacity: 0.05,
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView.builder(
                controller: _scrollController,
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
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: TokopediaColors.cardBackground,
      elevation: 1,
      leading: widget.isTablet || widget.isDesktop
          ? null
          : IconButton(
              icon: const Icon(Icons.arrow_back, color: TokopediaColors.textPrimary),
              onPressed: widget.onBack ?? () => Navigator.pop(context),
            ),
      automaticallyImplyLeading: !widget.isTablet && !widget.isDesktop,
      title: InkWell(
        onTap: () {},
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: TokopediaColors.primary,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  widget.chat.sellerName[0].toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.chat.sellerName,
                    style: const TextStyle(
                      color: TokopediaColors.textPrimary,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    widget.chat.isOnline ? 'online' : 'offline',
                    style: TextStyle(
                      color: widget.chat.isOnline
                          ? TokopediaColors.primary
                          : TokopediaColors.textSecondary,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam, color: TokopediaColors.textPrimary),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.call, color: TokopediaColors.textPrimary),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: TokopediaColors.textPrimary),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildMessageBubble(String text, bool isFromUser, String time) {
    return Align(
      alignment: isFromUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isFromUser
              ? TokopediaColors.chatBubbleSent
              : TokopediaColors.chatBubbleReceived,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8),
            topRight: const Radius.circular(8),
            bottomLeft: Radius.circular(isFromUser ? 8 : 0),
            bottomRight: Radius.circular(isFromUser ? 0 : 8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 11,
                  ),
                ),
                if (isFromUser) ...[
                  const SizedBox(width: 4),
                  Icon(
                    Icons.done_all,
                    size: 16,
                    color: TokopediaColors.primary,
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: TokopediaColors.cardBackground,
        border: Border(
          top: BorderSide(color: TokopediaColors.divider, width: 1),
        ),
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.emoji_emotions_outlined, color: TokopediaColors.textSecondary),
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
                  style: const TextStyle(color: TokopediaColors.textPrimary),
                  decoration: const InputDecoration(
                    hintText: 'Type a message',
                    hintStyle: TextStyle(color: TokopediaColors.textSecondary),
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.attach_file, color: TokopediaColors.textSecondary),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt, color: TokopediaColors.textSecondary),
              onPressed: () {},
            ),
            Container(
              decoration: const BoxDecoration(
                color: TokopediaColors.primary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white, size: 20),
                onPressed: () {
                  if (_messageController.text.isNotEmpty) {
                    setState(() {
                      _messages.add({
                        'text': _messageController.text,
                        'isFromUser': true,
                        'time': TimeOfDay.now().format(context),
                      });
                      _messageController.clear();
                    });
                    _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent + 100,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}