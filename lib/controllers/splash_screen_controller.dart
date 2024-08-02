import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/screens/dice_roller_screen.dart';

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
        Get.off(const DiceRollerScreen());
      },
    );
  }
}
