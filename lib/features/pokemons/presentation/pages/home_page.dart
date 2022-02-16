import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';

import '../../../../consts/texts_styles.dart';
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: isDark ? _dark.backgroundColor : _light.backgroundColor,
          body: SingleChildScrollView(
            child: Column(
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
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: 354,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    children: List.generate(50,(index){
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                        decoration: BoxDecoration(
                          color: isDark ? _dark.backgroundColor : _light.backgroundColor,
                          border: Border.all(
                              width: 3, //
                              color: Colors.green//              <--- border width here
                          ),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text('$index',),
                              alignment: Alignment.topRight,
                            ),
                            Image.network(
                              "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
                              scale: 9,
                              loadingBuilder: (context, child, loading) {
                                if (loading == null) return Center(child: child);
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, object, error) {
                                return const Center(child: CircularProgressIndicator());
                              },
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
                                      bottomRight: Radius.circular(7)
                                  ),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.green
                                  )
                                ),
                                child: const Center(child: Text("Bulbasaur")),
                              ),
                            )
                          ],
                        ),
                      );

                    }),
                  ),
                ),
                // GridView.count(
                //   crossAxisCount: 3,
                //   children: List.generate(6, (index){
                //     return Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                //       decoration: BoxDecoration(
                //         color: isDark ? _dark.backgroundColor : _light.backgroundColor,
                //         border: Border.all(
                //             width: 3, //
                //             color: Colors.green//              <--- border width here
                //         ),
                //         borderRadius: const BorderRadius.only(
                //             topLeft: Radius.circular(10),
                //             topRight: Radius.circular(10),
                //             bottomLeft: Radius.circular(10),
                //             bottomRight: Radius.circular(10)
                //         ),
                //       ),
                //       child: Column(
                //         children: [
                //           Container(
                //             child: Text('$index',),
                //             alignment: Alignment.topRight,
                //           ),
                //           Image.network(
                //             "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
                //             scale: 9,
                //             loadingBuilder: (context, child, loading) {
                //               if (loading == null) return Center(child: child);
                //               return const Center(child: CircularProgressIndicator());
                //             },
                //             errorBuilder: (context, object, error) {
                //               return const Center(child: CircularProgressIndicator());
                //             },
                //           ),
                //           Container(
                //             child: Text("Bulbasaur"),
                //           ),
                //           Container(
                //             height: 20,
                //             decoration: const BoxDecoration(
                //               color: Colors.green,
                //               borderRadius: BorderRadius.only(
                //                   bottomLeft: Radius.circular(10),
                //                   bottomRight: Radius.circular(10)
                //               ),
                //             ),
                //           )
                //         ],
                //       ),
                //     );
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
