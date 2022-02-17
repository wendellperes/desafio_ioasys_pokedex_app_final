import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';

import '../../../../consts/texts_styles.dart';
import '../widgets/List_cards_pokemons_widgets.dart';
import '../widgets/header_top_widgets.dart';
import '../widgets/no_search_widgets.dart';
import '../widgets/title_and_icon.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDark = false;
  final ThemeData _dark = ThemeData(backgroundColor: AppColors.darkBackground);
  final ThemeData _light = ThemeData(backgroundColor: AppColors.whiteBackground);
  int count = 000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? _dark.backgroundColor : _light.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderTop(),
            const SizedBox(
              height: 35,
            ),
            //TODO: Input Search
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Buscar',
                    hintText: 'Buscar pokemon',
                    hintStyle: TextStyle(
                        color: AppColors.darktext,
                        fontSize: 15,
                        fontWeight: FontWeight.w400
                    ),
                    labelStyle: TextStyle(
                      fontSize: 17,
                      color: AppColors.pinkBackground,
                      fontWeight: FontWeight.w400,
                    ),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.pinkBackground),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.pinkBackground),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.pinkBackground),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    border:  OutlineInputBorder(
                        borderSide: BorderSide(color: AppColors.pinkBackground),
                        borderRadius: const BorderRadius.all(Radius.circular(12))
                    ),
                    suffixIcon: IconButton(
                      color: AppColors.pinkBackground,
                      icon: const Icon(Icons.search,),
                      onPressed: (){

                      },
                    )
                ),
              ),
            ),
           const SizedBox(
              height: 10,
            ),
            Stack(
              children: const [
                CardsPokemonsList(),
                Visibility(
                  visible: false,
                  child: NoSearch(),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
