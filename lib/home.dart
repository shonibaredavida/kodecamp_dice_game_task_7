import 'dart:math';
import 'package:flutter/material.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/colors.dart';
import 'package:kodecamp_dice_game_task_7/utils/constants/sizes.dart';

final randomizer = Random();

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [],
        ),
      ),
    );
  }
}
