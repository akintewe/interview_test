import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_constants.dart';

class ContactsController extends GetxController {
  final RxString selectedTab = 'Contacts'.obs;
  
  void changeTab(String tab) {
    selectedTab.value = tab;
  }
}

class ContactsView extends GetView<ContactsController> {
  const ContactsView({super.key});

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
              padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: Colors.white, size: 32),
                    onPressed: () => Get.back(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Contacts',
                    style: AppTextStyles.title.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _buildTabs(),
          Obx(() => Expanded(
            child: controller.selectedTab.value == 'Contacts' 
              ? _buildContactsList()
              : _buildGroupsList(),
          )),
          Transform.translate(
            offset: Offset(0, _getButtonOffset(context)),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Can't find your contact?",
                    style: AppTextStyles.subtitle.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 175,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Invite here',
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
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
      ),
    );
  }

  Widget _buildTabs() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFF5F5F5),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: ['Contacts', 'Groups'].map((tab) => Obx(() {
          final isSelected = controller.selectedTab.value == tab;
          return GestureDetector(
            onTap: () => controller.changeTab(tab),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    width: 2,
                  ),
                ),
              ),
              child: Text(
                tab,
                style: AppTextStyles.title.copyWith(
                  color: isSelected ? AppColors.primary : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        })).toList(),
      ),
    );
  }

  Widget _buildContactsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF5F5F5),
      ),
      itemBuilder: (context, index) => _buildContactItem(index >= 4),
    );
  }

  Widget _buildContactItem(bool hasImage) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: hasImage ? null : AppColors.headerIconBackground,
          shape: BoxShape.circle,
        ),
        child: hasImage
            ? ClipOval(
                child: Image.asset(
                  'assets/images/Ellipse 83 (1).png',
                  fit: BoxFit.cover,
                ),
              )
            :  Center(
              child: SizedBox(
                height: 34,
                width: 34,
                child: SvgPicture.asset('assets/svg/Group 21418.svg')),
            )
      ),
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tabish Bin Tahir',
                style: AppTextStyles.title.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                'tabish_m2m',
                style: AppTextStyles.subtitle.copyWith(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
          Container(
            height: 22,
            width: 83,
            padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            decoration: BoxDecoration(
              color: Color.fromRGBO(0, 74, 173, 0.08),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(
                'Speciality',
                style: AppTextStyles.subtitle.copyWith(
                  color: AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
      trailing: CircleAvatar(
        backgroundColor: Color.fromRGBO(248, 248, 248, 1),

        child: SvgPicture.asset(
          'assets/svg/Combined Shape.svg',
          width: 24,
          height: 24,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildGroupsList() {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        thickness: 1,
        color: Color(0xFFF5F5F5),
      ),
      itemBuilder: (context, index) => _buildGroupItem(),
    );
  }

  Widget _buildGroupItem() {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: const BoxDecoration(
          color: Color(0xFFF8F8F8),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/svg/Group 177014.svg',
            width: 45,
            height: 45,
          ),
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Group name',
            style: AppTextStyles.title.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            'groupname_12',
            style: AppTextStyles.subtitle.copyWith(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
      trailing: CircleAvatar(
        backgroundColor: const Color(0xFFF8F8F8),
        child: SvgPicture.asset(
          'assets/svg/Combined Shape.svg',
          width: 24,
          height: 24,
          color: Colors.grey,
        ),
      ),
    );
  }

  double _getButtonOffset(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    
    // Check if device is iPhone Pro model (approximate dimensions)
    if ((height >= 844 && height <= 932) && (width >= 390 && width <= 430)) {
      return -(height * 0.001); // Smaller upward offset for Pro models
    }
    
    return -(height * 0.02); // Default offset for other devices
  }
} 