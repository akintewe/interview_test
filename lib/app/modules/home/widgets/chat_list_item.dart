// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../core/constants/app_constants.dart';
// import '../../../data/models/chat_message.dart';
// import 'group_avatar.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:get/get.dart';
// import '../../../modules/chat/views/chat_detail_view.dart';

// class ChatListItem extends StatelessWidget {
//   final ChatMessage message;
//   final VoidCallback? onTap;
//   final bool isDesktop;

//   const ChatListItem({
//     super.key,
//     required this.message,
//     this.onTap,
//     this.isDesktop = false,
//   });

//   Widget _buildAvatar(String assetPath, double size) {
//     final isAssetSvg = assetPath.toLowerCase().endsWith('.svg');
    
//     return Center(
//       child: SizedBox(
//         height: size,
//         width: size,
//         child: ClipOval(
//           child: isAssetSvg
//               ? SvgPicture.asset(
//                   assetPath,
//                   fit: BoxFit.contain,
//                 )
//               : Image.asset(
//                   assetPath,
//                   fit: BoxFit.cover,
//                 ),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isAvatarPng = message.avatarUrl?.toLowerCase().endsWith('.png') ?? false;
    
//     return Slidable(
//       key: Key(message.id),
//       endActionPane: ActionPane(
//         motion: const ScrollMotion(),
//         extentRatio: 0.25,
//         children: [
//           SlidableAction(
//             onPressed: (context) {
             
//             },
//             backgroundColor: AppColors.primary,
//             foregroundColor: Colors.white,
//             icon: Icons.more_horiz,
//             label: 'More',
//           ),
//         ],
//       ),
//       child: ListTile(
//         onTap: () => Get.to(() => ChatDetailView(message: message)),
//         contentPadding: EdgeInsets.symmetric(
//           horizontal: isDesktop ? AppSizes.paddingL : AppSizes.paddingXS,
//           vertical: AppSizes.paddingXS,
//         ),
//         leading: Container(
//           width: AppSizes.avatarSize * 1.5,
//           height: AppSizes.avatarSize * 1.5,
//           decoration: BoxDecoration(
//             color: isAvatarPng ? Color.fromRGBO(248, 213, 73, 1) : AppColors.headerIconBackground,
//             shape: BoxShape.circle,
//           ),
//           child: message.isGroup && message.groupAvatarUrls != null
//               ? GroupAvatar(
//                   avatarAssets: message.groupAvatarUrls!,
//                   size: AppSizes.avatarSize * 1.5,
//                 )
//               : message.avatarUrl != null
//                   ? _buildAvatar(
//                       message.avatarUrl!,
//                       AppSizes.avatarSize * 0.8,
//                     )
//                   : Icon(
//                       Icons.person,
//                       size: AppSizes.iconSize,
//                       color: AppColors.textSecondary,
//                     ),
//         ),
//         title: Padding(
//           padding: const EdgeInsets.only(bottom: 4),
//           child: Text(
//             message.isGroup ? message.groupName! : message.senderName,
//             style: isDesktop 
//                 ? AppTextStyles.title.copyWith(fontSize: 18)
//                 : AppTextStyles.title,
//           ),
//         ),
//         subtitle: RichText(
//           text: TextSpan(
//             children: message.isGroup
//                 ? [
//                     TextSpan(
//                       text: "Anna: ",
//                       style: AppTextStyles.subtitle.copyWith(
//                         color: AppColors.primary,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     TextSpan(
//                       text: message.message,
//                       style: AppTextStyles.subtitle,
//                     ),
//                   ]
//                 : [
//                     TextSpan(
//                       text: message.message,
//                       style: AppTextStyles.subtitle,
//                     ),
//                   ],
//           ),
//         ),
//         trailing: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               message.timeAgo,
//               style: AppTextStyles.timeText,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// } 


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../data/models/chat_message.dart';
import 'group_avatar.dart';
import 'package:get/get.dart';
import '../../../modules/chat/views/chat_detail_view.dart';

class ChatListItem extends StatelessWidget {
  final ChatMessage message;
  final VoidCallback? onTap;
  final bool isDesktop;

  const ChatListItem({
    super.key,
    required this.message,
    this.onTap,
    this.isDesktop = false,
  });

  Widget _buildAvatar(String assetPath, double size) {
    final isAssetSvg = assetPath.toLowerCase().endsWith('.svg');
    
    return Center(
      child: SizedBox(
        height: size,
        width: size,
        child: ClipOval(
          child: isAssetSvg
              ? SvgPicture.asset(
                  assetPath,
                  fit: BoxFit.contain,
                )
              : Image.asset(
                  assetPath,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isAvatarPng = message.avatarUrl?.toLowerCase().endsWith('.png') ?? false;
    
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Show more options when swiped
        if (details.primaryVelocity! < 0) {
          showModalBottomSheet(
            context: context,
            builder: (context) => Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    leading: const Icon(Icons.more_horiz),
                    title: const Text('More'),
                    onTap: () {
                      Navigator.pop(context);
                      // Add your more action here
                    },
                  ),
                ],
              ),
            ),
          );
        }
      },
      child: ListTile(
        onTap: () => Get.to(() => ChatDetailView(message: message)),
        contentPadding: EdgeInsets.symmetric(
          horizontal: isDesktop ? AppSizes.paddingL : AppSizes.paddingXS,
          vertical: AppSizes.paddingXS,
        ),
        leading: Container(
          width: AppSizes.avatarSize * 1.5,
          height: AppSizes.avatarSize * 1.5,
          decoration: BoxDecoration(
            color: isAvatarPng ? Color.fromRGBO(248, 213, 73, 1) : AppColors.headerIconBackground,
            shape: BoxShape.circle,
          ),
          child: message.isGroup && message.groupAvatarUrls != null
              ? GroupAvatar(
                  avatarAssets: message.groupAvatarUrls!,
                  size: AppSizes.avatarSize * 1.5,
                )
              : message.avatarUrl != null
                  ? _buildAvatar(
                      message.avatarUrl!,
                      AppSizes.avatarSize * 0.8,
                    )
                  : Icon(
                      Icons.person,
                      size: AppSizes.iconSize,
                      color: AppColors.textSecondary,
                    ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            message.isGroup ? message.groupName! : message.senderName,
            style: isDesktop 
                ? AppTextStyles.title.copyWith(fontSize: 18)
                : AppTextStyles.title,
          ),
        ),
        subtitle: RichText(
          text: TextSpan(
            children: message.isGroup
                ? [
                    TextSpan(
                      text: "Anna: ",
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: message.message,
                      style: AppTextStyles.subtitle,
                    ),
                  ]
                : [
                    TextSpan(
                      text: message.message,
                      style: AppTextStyles.subtitle,
                    ),
                  ],
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              message.timeAgo,
              style: AppTextStyles.timeText,
            ),
          ],
        ),
      ),
    );
  }
}