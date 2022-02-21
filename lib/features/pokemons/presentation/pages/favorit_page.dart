import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';

import '../../../../consts/texts_styles.dart';
import '../widgets/List_cards_pokemons_widgets.dart';
import '../widgets/header_top_widgets.dart';
import '../widgets/no_search_widgets.dart';
import '../widgets/title_and_icon.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  bool isDark = false;
  final ThemeData _dark = ThemeData(backgroundColor: AppColors.darkBackground);
  final ThemeData _light =
      ThemeData(backgroundColor: AppColors.whiteBackground);
  int count = 000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? _dark.backgroundColor : _light.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderTop(
              value: false,
              onChange: (value) {},
            ),
            const SizedBox(
              height: 45,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.favorite,
                    color: AppColors.pinkBackground,
                  ),
                  Text('Meus favoritos', style: AppTextStyles.titleFavorit),
                ],
              ),
            ),
            const SizedBox(
              height: 63,
            ),
            Stack(
              children: const [
                //CardsPokemonsList(),
                Visibility(
                  visible: false,
                  child: NoSearch(),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {},
        child: Container(
          child: Column(
            children: [
              Icon(
                Icons.arrow_back,
                color: AppColors.pinkBackground,
                size: 30,
              ),
              Text(
                'Voltar',
                style: GoogleFonts.poppins(
                    fontSize: 12, color: AppColors.pinkBackground),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
