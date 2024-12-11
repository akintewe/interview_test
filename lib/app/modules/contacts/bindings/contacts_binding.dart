import 'package:get/get.dart';
import '../views/contacts_view.dart';

class ContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactsController>(
      () => ContactsController(),
    );
  }
} 