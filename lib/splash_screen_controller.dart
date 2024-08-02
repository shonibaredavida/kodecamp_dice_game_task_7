import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/dice_roller.dart';
import 'package:kodecamp_dice_game_task_7/home.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    navigateToGame();
    super.onInit();
  }

  void navigateToGame() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(Home());
      },
    );
  }
}
