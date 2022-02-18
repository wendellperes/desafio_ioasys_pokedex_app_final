import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/utils/getImage.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool isFavorit = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
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
                      color: AppColors.whiteBackground,
                      size: 33,
                    )),
                Text(
                  'Pokemon Name',
                  style: GoogleFonts.poppins(
                      color: AppColors.whiteBackground,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal),
                ),
                Text(
                  '#001',
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
                              alignment: Alignment.center,
                              width: 52,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Grass',
                                style: GoogleFonts.poppins(
                                  color: AppColors.whiteBackground,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 18,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 52,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Text(
                                'Poison',
                                style: GoogleFonts.poppins(
                                  color: AppColors.whiteBackground,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 35, top: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.anchor,
                                      size: 20,
                                    ),
                                    Text(
                                      '6,9 kg',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.darktext,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset('images/scale.png'),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      '6,9 kg',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Weight',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.darktext,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Chlorophyll / Overgrow',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Moves',
                                      style: GoogleFonts.poppins(
                                          fontSize: 12,
                                          color: AppColors.darktext,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal),
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
                        margin:
                            const EdgeInsets.only(left: 35, top: 30, right: 10),
                        child: Text(
                          'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
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
                        margin: const EdgeInsets.only(left: 35, top: 30),
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
                        margin: const EdgeInsets.only(left: 35, top: 15),
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
                                  'SPD',
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.5,
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.5,
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.5,
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.5,
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.2,
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
                                      '35',
                                      style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          fontStyle: FontStyle.normal,
                                          color: AppColors.darkGray),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          height: 6,
                                          width: 170,
                                          decoration: const BoxDecoration(
                                              gradient: LinearGradient(colors: [
                                            Colors.green,
                                            Colors.lightGreenAccent
                                          ], stops: [
                                            0.55,
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
            margin: EdgeInsets.only(left: 50, right: 50, top: 40),
            child: Image.network(
              GetImagePokemon.PokemonFrontHome(1),
              scale: 2,
            ),
          ),
        ],
      ),
    );
  }
}
