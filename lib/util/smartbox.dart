import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmartBox extends StatelessWidget {
  final String text;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? switchOn;
  const SmartBox({
    Key? key,
    required this.text,
    required this.iconPath,
    required this.powerOn,
    this.switchOn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: powerOn ? Colors.grey[900] : Colors.grey[300]),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                iconPath,
                height: 65,
                color: powerOn ? Colors.white : Colors.grey[900],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: powerOn ? Colors.white : Colors.grey[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  )),
                  Transform.rotate(
                      angle: pi / 2,
                      child:
                          CupertinoSwitch(value: powerOn, onChanged: switchOn))
                ],
              ),
            ]),
      ),
    );
  }
}
