import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kodecamp_dice_game_task_7/functions/function.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/colors.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/images.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

class DiceRollController extends GetxController {
  final randomizer = Random();
  var currentDice = "".obs;
  List thrownValues = [].obs;
  var displayText = "".obs;
  final _isLoading = false.obs;
  get isLoading => _isLoading.value;

  void restartDiceGame() {
    currentDice.value = AppImages.dice1;
    thrownValues = [];
    displayText.value = "";
    Get.closeAllSnackbars();
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
    int lenght = 0;

    for (final value in thrownValues) {
      lenght += 1;
      //  print("thr l ${thrownValues.length} legt: $lenght");
      if (thrownValues.length == lenght) {
        displayText.value += "$value ";
        //  print(1);
      } else {
        displayText.value += "$value, ";
        //print(2);
      }
    }
    /*   diceToast(
      text: "Selected Numbers: ${displayText.value}",
      fontsize: DiceSizes.fontSizeXXLg,
      longDuration: true,
    ); */
    Fluttertoast.cancel();
    await Future.delayed(const Duration(milliseconds: 500), () {
      //print(thrownValues);
    });
    Get.showSnackbar(
      GetSnackBar(
        titleText: Text(
          "Selected Numbers:",
          style: TextStyle(color: whiteColor, fontSize: DiceSizes.fontSizeXLg),
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 2),
        messageText: Text(
          " ${displayText.value}",
          style: TextStyle(color: whiteColor, fontSize: DiceSizes.fontSizeLg),
          textAlign: TextAlign.center,
        ),
      ),
    );
    await Future.delayed(const Duration(milliseconds: 1200), () {});
  }

  Future rollDice() async {
    currentDice.value = AppImages.onSelect;
    Get.closeAllSnackbars();
    Fluttertoast.cancel();
    _isLoading.value = true;
    refresh();
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
      diceToast(text: "An odd number is thrown");
      thrownValues.add(value + 1);
    }
    //thrownValues.length == 6
    if (thrownValues.length == 6) {
      await Future.delayed(const Duration(milliseconds: 700), () {});

      await displaValuesList();
      refresh();
    }
    //print(thrownValues);
    _isLoading.value = false;
    refresh();
  }
}
