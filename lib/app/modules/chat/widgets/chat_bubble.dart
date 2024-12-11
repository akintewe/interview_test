import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const ChatBubble({
    super.key,
    required this.text,
    required this.isSender,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: isSender ? 64 : 0,
        right: isSender ? 0 : 64,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSender) ...[
            CircleAvatar(
              radius: 16,
              backgroundImage: AssetImage('assets/images/Ellipse 83 (1).png'),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all( color:  isSender ? Color.fromRGBO(248, 248, 248, 1) : Color.fromRGBO(0, 74, 173, 1)),
                color: isSender ? Color.fromRGBO(248, 248, 248, 1) : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(15),
                  topRight: const Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: isSender ? Colors.black : Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
} 