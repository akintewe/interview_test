import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/responsive_helper.dart';
import '../controllers/home_controller.dart';
import '../widgets/chat_list_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.getWidth(context),
            ),
            child: Column(
              children: [
                _buildHeader(context),
                _buildSearchBar(context),
                _buildTabs(context),
                _buildChatList(context),
             
                _buildBottomButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        ResponsiveHelper.isMobile(context) 
            ? AppSizes.paddingM 
            : AppSizes.paddingL,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.headerIconBackground,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.menu, size: 20),
              padding: EdgeInsets.zero,
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 20),
          Text('Home', style: AppTextStyles.heading),
          const Spacer(),
          _buildHeaderIcon('assets/svg/3 User.svg', 'Groups', onTap: () => Get.toNamed('/groups')),
          _buildHeaderIcon('assets/svg/Contacts.svg', 'Contacts', onTap: () => Get.toNamed('/contacts')),
          _buildHeaderIcon('assets/svg/Settings.svg', 'Settings', onTap: () => Get.toNamed('/settings')),
        ],
      ),
    );
  }

  Widget _buildHeaderIcon(String icon, String label, {VoidCallback? onTap}) {
    return Transform.translate(
      offset: Offset(0, 13),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingS),
        child: GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.headerIconBackground,
                radius: 20,
                child: SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.secondary,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingM,
      ),
      decoration: BoxDecoration(
        color: AppColors.searchBackground,
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search here',
          hintStyle: AppTextStyles.searchHint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              'assets/svg/Icon (3).svg',
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSizes.radiusXL),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSizes.paddingM,
            vertical: AppSizes.paddingM,
          ),
        ),
        onChanged: controller.updateSearch,
      ),
    );
  }

  Widget _buildTabs(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: AppSizes.paddingS,
        bottom: AppSizes.paddingM,
        left: AppSizes.paddingM,
        right: AppSizes.paddingM,
      ),
      height: 32,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => const SizedBox(width: AppSizes.paddingS),
        itemCount: controller.tabs.length,
        itemBuilder: (context, index) {
          return Obx(() {
            final tab = controller.tabs[index];
            final isSelected = controller.selectedTab.value == tab;
            final isAllTab = tab == 'All';
            return Container(
              constraints: BoxConstraints(
                minWidth: isAllTab ? 60 : 80,
              ),
              decoration: BoxDecoration(
                color: isSelected 
                    ? AppColors.chipSelectedBackground.withOpacity(0.15) 
                    : Color.fromRGBO(248, 248, 248, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => controller.changeTab(tab),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isAllTab ? AppSizes.paddingM : AppSizes.paddingL,
                        vertical: AppSizes.paddingXS,
                      ),
                      child: Text(
                        tab,
                        style: AppTextStyles.chipLabel.copyWith(
                          color: isSelected ? AppColors.primary : AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildChatList(BuildContext context) {
    return Expanded(
      child: Obx(() => ListView.separated(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingS,
        ),
        itemCount: controller.messages.length,
        separatorBuilder: (context, index) =>  Divider(
          color: Colors.grey.withOpacity(0.1),
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final message = controller.messages[index];
          return ChatListItem(
            message: message,
            isDesktop: ResponsiveHelper.isDesktop(context),
          );
        },
      )),
    );
  }
Widget _buildBottomButtons(BuildContext context) {
  if (ResponsiveHelper.isDesktop(context)) {
    return const SizedBox.shrink();
  }

  return Container(
    height: 100,
    padding: const EdgeInsets.only(bottom: 20),
    child: Stack(
      children: [
        Transform.translate(
          offset: Offset(0, -10),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 175,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(5),
                  child: Center(
                    child: Text(
                      'Send new message',
                      style: AppTextStyles.subtitle.copyWith(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 24,
          right: AppSizes.paddingM,
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(28),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40
                ,
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