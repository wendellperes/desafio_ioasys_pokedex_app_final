import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../../consts/colors_type.dart';
import 'title_and_icon.dart';
class HeaderTop extends StatefulWidget {
  const HeaderTop({Key? key}) : super(key: key);

  @override
  State<HeaderTop> createState() => _HeaderTopState();
}

class _HeaderTopState extends State<HeaderTop> {
  bool isDark = false;
  final ThemeData _dark = ThemeData(backgroundColor: AppColors.darkBackground);
  final ThemeData _light = ThemeData(backgroundColor: AppColors.whiteBackground);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          color: AppColors.pinkBackground,
        ),
        const SizedBox(
          height: 73,
        ),
        //TODO: Header homePage
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TitleApp(),
              const SizedBox(
                width: 10,
              ),
              FlutterSwitch(
                width: 45.0,
                height: 30.0,
                toggleSize: 20.0,
                value: isDark,
                borderRadius: 30.0,
                padding: 2.0,
                toggleColor: Colors.white,
                inactiveToggleColor: Colors.grey,
                inactiveColor: Colors.white,
                switchBorder: Border.all(
                  color: AppColors.pinkBackground,
                  width: 1.0,
                ),
                activeColor: Colors.white,
                activeToggleColor: AppColors.pinkBackground,
                onToggle: (val) {
                  setState(() {
                    isDark = val;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
