import 'package:get/get.dart';
import 'package:new_version/new_version.dart';

class UpdateCheckServices extends GetxController {
  @override
  void onInit() async {
    final newVersion = NewVersion(androidId: "com.android");
    newVersion.showAlertIfNecessary(context: Get.context!);
    final status = await newVersion.getVersionStatus();
    if (status != null) {
      newVersion.showUpdateDialog(
        context: Get.context!,
        versionStatus: status,
        updateButtonText: "আপডেট",
        dismissAction: () {},
        dismissButtonText: "এখন না",
        allowDismissal: false,
        dialogTitle: "আপডেট করুন!",
        dialogText:
            "অ্যাপে নতুন নতুন ফিচার যুক্ত করা হয়েছে। আপনি যদি সেই ফিচারের সুবিধা গুলো পেতে চান তাহলে অ্যাপটি আপডেট করুন, ধন্যবাদ । ",
      );
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
