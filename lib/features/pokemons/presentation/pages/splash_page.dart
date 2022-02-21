import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/consts/texts_styles.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  void navigationToNextPage() {
    Navigator.pushReplacementNamed(context, '/HomePage');
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationToNextPage);
  }

  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return Scaffold(
      backgroundColor: AppColors.pinkBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo_ioasys.png',
            ),
            Text(
              'ioasys pokédex',
              style: AppTextStyles.title,
            )
          ],
        ),
      ),
    );
  }
}
