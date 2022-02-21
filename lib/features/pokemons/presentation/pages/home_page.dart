import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/presentation/controllers/home_page_controller.dart';
import '../../../../consts/texts_styles.dart';
import '../../../../core/dependency_injector.dart';
import '../widgets/List_cards_pokemons_widgets.dart';
import '../widgets/header_top_widgets.dart';
import '../widgets/no_search_widgets.dart';
import '../widgets/title_and_icon.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: prefer_const_constructors
  Widget build(BuildContext context) => HomePageView(
        controller: serviceLocator.get<HomePageController>(),
      );
}

class HomePageView extends StatefulWidget {
  const HomePageView({required this.controller, Key? key}) : super(key: key);
  final HomePageController controller;

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  HomePageController get _controller => widget.controller;
  final TextEditingController _pesquisa = TextEditingController();
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
    await _controller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _controller.theme,
      builder: (BuildContext context, Color theme, Widget? child) {
        return Scaffold(
          backgroundColor: theme,
          body: SingleChildScrollView(
            child: Column(
              children: [
                HeaderTop(
                  value: _controller.isDark.value,
                  onChange: (value) => _controller.changeTheme(value),
                ),
                const SizedBox(
                  height: 35,
                ),
                //TODO: Input Search
                Container(
                  width: 350,
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: _pesquisa,
                          decoration: InputDecoration(
                              labelText: 'Buscar',
                              hintText: 'Buscar pokemon',
                              hintStyle: TextStyle(
                                  color: AppColors.darktext,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                              labelStyle: TextStyle(
                                fontSize: 17,
                                color: AppColors.pinkBackground,
                                fontWeight: FontWeight.w400,
                              ),
                              disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.pinkBackground),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.pinkBackground),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.pinkBackground),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: AppColors.pinkBackground),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(12))),
                              suffixIcon: IconButton(
                                color: AppColors.pinkBackground,
                                icon: const Icon(
                                  Icons.search,
                                ),
                                onPressed: () {
                                  _controller.getPokemonByName('bulbasaur');
                                },
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () => {print('Ir ate favorit')},
                        child: Icon(
                          Icons.favorite,
                          size: 33,
                          color: AppColors.pinkBackground,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Stack(
                  children: [
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (_, __) => _controller.state.when(
                        success: (value) {
                          final pokemons = value as List<PokemonEntity>;
                          return SizedBox(
                            height: 465,
                            width: 354,
                            child: GridView.count(
                              scrollDirection: Axis.vertical,
                              crossAxisCount: 3,
                              children: List.generate(pokemons.length, (index) {
                                return CardsPokemonsList(
                                  pokemons: pokemons[index],
                                );
                              }),
                            ),
                          );
                        },
                        loading: () {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 250),
                            child: Center(
                              child: Column(
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
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
