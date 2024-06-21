import 'package:get/get.dart';
import 'package:kreasi_nusantara/app/modules/profile_page/edit_profile/controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileViewController>(() => EditProfileViewController());
  }
}
