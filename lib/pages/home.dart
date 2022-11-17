import 'package:flutter/material.dart';

import '../util/smartbox.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final horizontalPadding = 25.0;
  final verticalPadding = 10.0;
  List myDevices = [
    ['Smart Light', 'assets/light-bulb.png', true],
    ['Smart AC', 'assets/air-conditioner.png', false],
    ['Smart TV', 'assets/smart-tv.png', false],
    ['Smart Fan', 'assets/fan.png', false],
  ];

  void powerSwitch(bool value, int index) {
    setState(() {
      myDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.person,
                      size: 45,
                      color: Colors.grey[800],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Welcome Home, ',
                      style: TextStyle(color: Colors.grey[700], fontSize: 22)),
                  const Text(
                    'ANDY DOE',
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: verticalPadding),
              child: Text(
                'Smart Devices',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[800]),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  padding: const EdgeInsets.all(20),
                  itemCount: myDevices.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.2, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return SmartBox(
                      text: myDevices[index][0],
                      iconPath: myDevices[index][1],
                      powerOn: myDevices[index][2],
                      switchOn: (value) => powerSwitch(value, index),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
