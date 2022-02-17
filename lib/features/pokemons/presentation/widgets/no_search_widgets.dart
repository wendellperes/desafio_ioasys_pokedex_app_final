import 'package:flutter/material.dart';

import '../../../../consts/colors_type.dart';
class NoSearch extends StatelessWidget {
  const NoSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Ops',
            style: TextStyle(
                color: AppColors.darktext2,
                fontSize: 135,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal
            ),
          ),
          SizedBox(
            height: 45,
          ),
          Text(
            'Este pokemon não está aqui ;(',
            style: TextStyle(
                color: AppColors.darktext2,
                fontSize: 22,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal
            ),
          )
        ],
      ),
    );
  }
}
