import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/utils/getColor.dart';

import '../../../../consts/colors_type.dart';
import '../../../../utils/getImage.dart';
import '../../domain/entities/result_Pokemon._entity.dart';

class CardsPokemonsList extends StatefulWidget {
  const CardsPokemonsList(
      {Key? key,
      required this.pokemons,
      required this.onTap,
      required this.color})
      : super(key: key);
  final PokemonEntity pokemons;
  final ValueNotifier<Color> color;
  final VoidCallback onTap;

  @override
  _CardsPokemonsListState createState() => _CardsPokemonsListState();
}

class _CardsPokemonsListState extends State<CardsPokemonsList> {
  bool isDark = false;
  final ThemeData _dark = ThemeData(backgroundColor: AppColors.darkBackground);
  final ThemeData _light =
      ThemeData(backgroundColor: AppColors.whiteBackground);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        child: ValueListenableBuilder(
          valueListenable: widget.color,
          builder: (BuildContext context, Color theme, Widget? child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              decoration: BoxDecoration(
                color: theme,
                border: Border.all(
                  width: 3, //
                  color: Colors.green,
                ),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: Text(
                      '# ${widget.pokemons.idPokemon}',
                      style: const TextStyle(color: Colors.green),
                    ),
                    alignment: Alignment.topRight,
                  ),
                  Image.network(
                    GetImagePokemon.PokemonFrontHome(
                        int.parse(widget.pokemons.idPokemon)),
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: Container(
                      height: 20,
                      width: 182,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              bottomRight: Radius.circular(7)),
                          border: Border.all(width: 2, color: Colors.green)),
                      child: Center(
                        child: Text("${widget.pokemons.name}"),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
