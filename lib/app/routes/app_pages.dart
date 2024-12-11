import 'package:get/get.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/chat/views/chat_detail_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/groups/views/groups_view.dart';
import '../modules/contacts/views/contacts_view.dart';
import '../modules/contacts/bindings/contacts_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/chat',
      page: () => ChatDetailView(message: Get.arguments),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/settings',
      page: () => const SettingsView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/groups',
      page: () => const GroupsView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: '/contacts',
      page: () => const ContactsView(),
      binding: ContactsBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
} 