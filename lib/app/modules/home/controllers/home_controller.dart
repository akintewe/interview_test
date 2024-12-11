import 'package:get/get.dart';
import '../../../data/models/chat_message.dart';

class HomeController extends GetxController {
  final RxString selectedTab = 'All'.obs;
  final RxString searchQuery = ''.obs;
  
  final List<String> tabs = ['All', 'Groups', 'Unread'];
  
  final RxList<ChatMessage> messages = <ChatMessage>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadMessages();
  }

  void loadMessages() {
    messages.value = [
      ChatMessage(
        id: '1',
        senderName: 'Tabish Bin Tahir',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        avatarUrl: 'assets/svg/Group 21418.svg',
      ),
       ChatMessage(
        id: '2',
        senderName: 'Tabish Bin Tahir',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        avatarUrl: 'assets/svg/Group 21418.svg',
      ),
       ChatMessage(
        id: '3',
        senderName: 'Tabish Bin Tahir',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        avatarUrl: 'assets/svg/Group 21418.svg',
      ),
        ChatMessage(
        id: '4',
        senderName: 'Tabish Bin Tahir',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        avatarUrl: 'assets/svg/Group 21418.svg',
      ),
       ChatMessage(
        id: '5',
        senderName: 'Tabish Bin Tahir',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        avatarUrl: 'assets/images/Ellipse 83.png',
      ),
      ChatMessage(
        id: '2',
        senderName: 'Group name',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        isGroup: true,
        groupName: 'Group name',
        groupAvatarUrls: [
         
          'assets/images/Ellipse 83.jpg',
            'assets/svg/Group 177014.svg',
        ],
      ),
       ChatMessage(
        id: '3',
        senderName: 'Group name',
        message: 'Hi Tabish, how are you doing?',
        timeAgo: '1 hour ago',
        isGroup: true,
        groupName: 'Group name',
        groupAvatarUrls: [
         
          'assets/images/Ellipse 83.jpg',
            'assets/svg/Group 177014.svg',
        ],
      ),
    ];
  }

  void changeTab(String tab) {
    selectedTab.value = tab;
  }

  void updateSearch(String query) {
    searchQuery.value = query;
  }
} 