class ChatMessage {
  final String id;
  final String senderName;
  final String message;
  final String timeAgo;
  final String? avatarUrl;
  final bool isGroup;
  final String? groupName;
  final List<String>? groupAvatarUrls;

  ChatMessage({
    required this.id,
    required this.senderName,
    required this.message,
    required this.timeAgo,
    this.avatarUrl,
    this.isGroup = false,
    this.groupName,
    this.groupAvatarUrls,
  });
} 