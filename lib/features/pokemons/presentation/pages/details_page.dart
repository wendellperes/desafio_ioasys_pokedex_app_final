import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/core/dependency_injector.dart';
import 'package:pekedex_ioasys/utils/getColor.dart';
import 'package:pekedex_ioasys/utils/getImage.dart';

import '../../domain/entities/result_Pokemon._entity.dart';
import '../../domain/usecases/pokemon_listar_all_usecase.dart';
import '../controllers/details_page_controller.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DetailsPageView(
        controller: serviceLocator.get<DetailsPageController>(),
      );
}

class DetailsPageView extends StatefulWidget {
  const DetailsPageView({required this.controller, Key? key}) : super(key: key);
  final DetailsPageController controller;

  @override
  _DetailsPageViewState createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPageView> {
  DetailsPageController get _controller => widget.controller;
  bool isFavorit = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) async {
        await _init();
      },
    );
  }

  Future<void> _init() async {
    await _controller.getData(idPokemon);
  }

  String idPokemon = '';

  @override
  Widget build(BuildContext context) {
    idPokemon = ModalRoute.of(context)?.settings.arguments as String;
    var formatter = NumberFormat('#,##,0,0');

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => _controller.state.when(
        success: (value) {
          final pokemon = value as PokemonResultEntity;
          List<String> abilites = [];
          if(pokemon.abilities! != null){
             abilites = pokemon.abilities!;
          }else{
            abilites = [];
          }
          print(abilites);
           
          final isColorWhite =
              ColorUtils.getColorByName(pokemon.color!) == Colors.white;
          return Scaffold(
            backgroundColor: ColorUtils.getColorByName(pokemon.color!),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 150),
                          child: Image.asset('images/pokeball.png')),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: isColorWhite
                                      ? AppColors.darkGray
                                      : AppColors.whiteBackground,
                                  size: 33,
                                )),
                            Text(
                              '#${pokemon.name!.toUpperCase()}',
                              style: GoogleFonts.poppins(
                                  color: AppColors.whiteBackground,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                            Text(
                              '#${pokemon.idPokemon}',
                              style: GoogleFonts.poppins(
                                  color: AppColors.whiteBackground,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.27,
                            left: 10,
                            right: 10),
                        height: 500,
                        width: 500,
                        decoration: BoxDecoration(
                            color: AppColors.whiteBackground,
                            borderRadius: BorderRadius.circular(25)),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isFavorit = !isFavorit;
                                        });
                                      },
                                      icon: isFavorit
                                          ? Icon(
                                              Icons.favorite,
                                              size: 33,
                                              color: AppColors.pinkBackground,
                                            )
                                          : Icon(
                                              Icons.favorite_outline,
                                              color: AppColors.pinkBackground,
                                              size: 33,
                                            ))
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 35),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 20,
                                          width: 320,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              itemCount: pokemon.types!.length,
                                              itemBuilder: (context, index) {
                                                return Container(
                                                  height: 50,
                                                  width: 95,
                                                  margin:
                                                      EdgeInsets.only(right: 5),
                                                  padding: EdgeInsets.all(2),
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: ColorUtils
                                                        .getColorByName(
                                                            pokemon.color!),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25),
                                                  ),
                                                  child: Text(
                                                    '${pokemon.types![index].toUpperCase()}',
                                                    style: GoogleFonts.poppins(
                                                      color: AppColors
                                                          .whiteBackground,
                                                      fontSize: 10,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                    ),
                                                  ),
                                                );
                                              }),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 35, top: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                const Icon(
                                                  Icons.anchor,
                                                  size: 20,
                                                ),
                                                Text(
                                                  formatter
                                                      .format(pokemon.weight),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Weight',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: AppColors.darktext,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 30,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset('images/scale.png'),
                                                const SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  '${NumberFormat.currency(locale: 'eu', symbol: '').format(pokemon.height)}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Height',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: AppColors.darktext,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  abilites.join(' / '),
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Moves',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 12,
                                                      color: AppColors.darktext,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                )
                                              ],
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  //TODO: Description
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 35, top: 30, right: 10),
                                    child: Text(
                                      '${pokemon.description!.replaceAll('\n', ' ')}',
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  //TODO: Status Base
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(
                                        left: 35, top: 30),
                                    child: Text(
                                      'Base Status',
                                      style: GoogleFonts.poppins(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.w700,
                                          fontStyle: FontStyle.normal),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 35, top: 15),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              'HP',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'ATK',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'DEF',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'SATK',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'SDEF',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'SPED',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle: FontStyle.normal,
                                                  color: Colors.green),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 2,
                                              height: 150,
                                              color: AppColors.lightGray,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![0]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![0] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![1]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![1] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![2]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![2] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![3]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![3] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![4]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![4] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  '${pokemon.stats![5]}',
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      color:
                                                          AppColors.darkGray),
                                                ),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 6,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: const [
                                                            Colors.green,
                                                            Colors
                                                                .lightGreenAccent
                                                          ],
                                                                  stops: [
                                                            (pokemon.stats![4] /
                                                                100),
                                                            0.0
                                                          ])),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 50, right: 50, top: 40),
                        child: Image.network(
                          GetImagePokemon.PokemonFrontHome(pokemon.idPokemon!),
                          scale: 2,
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              margin: const EdgeInsets.only(left: 50, right: 50, top: 40),
                              child: Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        loading: () {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.pinkBackground,
                    ),
                  ),
                  Text('Carregando...')
                ],
              ),
            ),
          );
        },
        orElse: () => Container(),
      ),
    );
  }
}
