import 'package:appvehicles/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    await redirect();
    super.onInit();
  }

  redirect() async {
    await 2.delay();
    Get.offAllNamed(Routes.PAGE_HOME);
  }
}
