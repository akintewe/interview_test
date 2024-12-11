import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../data/models/chat_message.dart';
import '../widgets/chat_bubble.dart';

class ChatDetailView extends StatelessWidget {
  final ChatMessage message;

  const ChatDetailView({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 29),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.white, size: 32),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 8),
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('assets/images/Ellipse 83 (1).png'),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        message.senderName,
                        style: AppTextStyles.title.copyWith(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Active 15 min ago',
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
               
                ChatBubble(
                  text: 'Hi Borther! Not sure if the address is correct for this job.',
                  isSender: true,
                ),

                 const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Today 9:30 pm',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                ChatBubble(
                  text: 'Let me check but I think we had it right',
                  isSender: false,
                ),
                ChatBubble(
                  text: 'Just confirmed and yes it is incorrect. Julie, can you please change it since you are the boss?',
                  isSender: true,
                ),
                ChatBubble(
                  text: 'Yep, I will get that done now',
                  isSender: false,
                ),
                ChatBubble(
                  text: 'Thank you and talk soon!',
                  isSender: true,
                ),
                _buildImageMessage('assets/images/Clear.png'),
              ],
            ),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildImageMessage(String imagePath) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        child: Image.asset(
          imagePath,
          width: 200,
          height: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(child: SvgPicture.asset('assets/svg/Group 1797.svg')),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Start typing a message...',
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 34,
                      width: 34,
                      margin: const EdgeInsets.only(right: 4),
                      decoration: BoxDecoration(
                    
                        color: Color.fromRGBO(0, 74, 173, 1),
                       borderRadius: BorderRadius.circular(10)
                      ),
                      child: Center(
                        child: SizedBox(
                          height: 18,
                          child: SvgPicture.asset('assets/svg/Group 176996.svg')),
                      )
                    ),
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