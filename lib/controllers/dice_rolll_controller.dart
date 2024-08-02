import 'dart:math';

import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/functions/function.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/images.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

class DiceRollController extends GetxController {
  final randomizer = Random();
  var currentDice = "".obs;
  List thrownValues = [].obs;
  var displayText = "".obs;
  final _isLoading = false.obs;
  get currentTurn => thrownValues.length;
  get isLoading => _isLoading.value;
  void restartDiceGame() {
    currentDice.value = AppImages.dice1;
    thrownValues = [];
    displayText.value = "";
    refresh();
    //print(thrownValues);
    //print("restart Game");
  }

  @override
  void onInit() {
    currentDice.value = "assets/one.png";
    super.onInit();
  }

  Future displaValuesList() async {
    for (final value in thrownValues) {
      displayText.value += "$value, ";
    }
    diceToast(
      text: "Selcted Values: ${displayText.value}",
      fontsize: DiceSizes.fontSizeXXLg,
      longDuration: true,
    );
    await Future.delayed(const Duration(milliseconds: 1200), () {
      //print(thrownValues);
    });
  }

  Future rollDice() async {
    currentDice.value = AppImages.onSelect;

    _isLoading.value = true;
    refresh();
    await Future.delayed(const Duration(milliseconds: 700), () {});
    int value = randomizer.nextInt(6);
    switch (value + 1) {
      case 1:
        currentDice.value = AppImages.dice1;
        break;
      case 2:
        currentDice.value = AppImages.dice2;
        break;
      case 3:
        currentDice.value = AppImages.dice3;
        break;
      case 4:
        currentDice.value = AppImages.dice4;
        break;
      case 5:
        currentDice.value = AppImages.dice5;
        break;
      case 6:
        currentDice.value = AppImages.dice6;
        break;
      default:
    }
    //A 6 has been thrown"
    if (value + 1 == 6) {
      diceToast(text: "A 6 has been thrown");
      thrownValues.add(value + 1);
    }
    //An even number is thrown
    else if (value + 1 == 2 || value + 1 == 4) {
      diceToast(text: "An even number is thrown");
      thrownValues.add(value + 1);
    }
    //An odd number throw
    else {
      diceToast(text: "An odd number thrown");
      thrownValues.add(value + 1);
    }
    //thrownValues.length == 6
    if (thrownValues.length == 6) {
      await Future.delayed(const Duration(milliseconds: 1200), () {});

      await displaValuesList();
      refresh();
    }
    //print(thrownValues);

    _isLoading.value = false;
    refresh();
  }
}
