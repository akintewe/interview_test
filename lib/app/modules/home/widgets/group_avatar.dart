import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_constants.dart';

class GroupAvatar extends StatelessWidget {
  final List<String> avatarAssets;
  final double size;

  const GroupAvatar({
    super.key,
    required this.avatarAssets,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.headerIconBackground,
        shape: BoxShape.circle,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: SvgPicture.asset(
              'assets/svg/Group 177014.svg',
              width: size * 0.9,
              height: size * 0.9,
              fit: BoxFit.contain,
            ),
          ),
          if (avatarAssets.isNotEmpty)
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: size * 0.4,
                height: size * 0.4,
                decoration: BoxDecoration(
                  color: AppColors.headerIconBackground,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SizedBox(
                    height: size * 0.25,
                    width: size * 0.25,
                    child: ClipOval(
                      child: Image.asset(
                        avatarAssets.first,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
} 