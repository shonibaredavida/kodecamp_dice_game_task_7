import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kodecamp_dice_game_task_7/functions/function.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/colors.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/images.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({
    Key? key,
  }) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  List thrownValues = [];
  bool _isLoading = false;
  var currentDice = "assets/one.png";
  String result = "";

  void restartDiceGame() {
    setState(() {
      currentDice = AppImages.dice1;
      thrownValues = [];
      //   print(thrownValues);
      //   print("restart Game");
    });
  }

  Future displaValuesList() async {
    String displayText = "";
    for (final value in thrownValues) {
      displayText += "$value, ";
    }
    diceToast(
      text: "Selcted Values: $displayText",
      fontsize: DiceSizes.fontSizeXXLg,
      longDuration: true,
    );
    await Future.delayed(const Duration(milliseconds: 1200), () {
      //  print(thrownValues);
    });
  }

  Future rollDice() async {
    currentDice = AppImages.onSelect;

    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 700), () {});
    int value = randomizer.nextInt(6);
    switch (value + 1) {
      case 1:
        currentDice = AppImages.dice1;
        break;
      case 2:
        currentDice = AppImages.dice2;
        break;
      case 3:
        currentDice = AppImages.dice3;
        break;
      case 4:
        currentDice = AppImages.dice4;
        break;
      case 5:
        currentDice = AppImages.dice5;
        break;
      case 6:
        currentDice = AppImages.dice6;
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
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 1200), () {});

      await displaValuesList();
    }
    //  print(thrownValues);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(children: [
          Positioned(
            top: 40,
            right: 40,
            child: Text.rich(
              TextSpan(
                  text: thrownValues.length.toString(),
                  style: const TextStyle(
                      fontSize: DiceSizes.fontSizeTitle, color: Colors.red),
                  children: const [
                    TextSpan(
                      text: "/6",
                      style: TextStyle(
                          fontSize: DiceSizes.fontSizeTitle * .8,
                          color: Colors.white),
                    )
                  ]),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: DiceSizes.spaceBtwSectionsSm,
              ),
              Image.asset(
                currentDice,
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : thrownValues.length < 6
                            ? rollDice
                            : restartDiceGame,
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: thrownValues.length < 6
                            ? Colors.yellow
                            : Colors.red.withOpacity(0.3),
                        foregroundColor: Colors.black,
                        textStyle: const TextStyle(fontSize: 28)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        thrownValues.length < 6
                            ? "Roll the dice"
                            : "Reset Game",
                        style: TextStyle(
                            fontSize: DiceSizes.fontSizeTitle,
                            color: thrownValues.length < 6
                                ? Colors.black
                                : Colors.white),
                      ),
                    )),
              ),
              const SizedBox(
                height: DiceSizes.spaceBtwSectionsMd,
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
