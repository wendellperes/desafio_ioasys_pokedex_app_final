import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../../consts/texts_styles.dart';
class TitleApp extends StatelessWidget {
  const TitleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SvgPicture.asset('images/logo_icon.svg'),
          SizedBox(
            width: 13,
          ),
          Text('ioasys pokédex', style: AppTextStyles.titlePink,)
        ],
      ),
    );
  }
}
