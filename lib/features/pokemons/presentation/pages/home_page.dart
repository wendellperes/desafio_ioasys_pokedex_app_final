import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';
import 'package:pekedex_ioasys/features/pokemons/domain/entities/pokemon_entity.dart';
import 'package:pekedex_ioasys/features/pokemons/presentation/controllers/home_page_controller.dart';
import '../../../../core/dependency_injector.dart';
import '../widgets/list_cards_pokemons_widgets.dart';
import '../widgets/header_top_widgets.dart';
import '../widgets/no_search_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
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
    await _controller.getData('');
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
                          onFieldSubmitted: (value) {
                            String textFormarter = value.replaceAll(' ', '');
                            if (value.isNotEmpty) {
                              _controller.getPokemonByName(
                                  textFormarter.toLowerCase());
                            } else {
                              _controller.getData('');
                            }
                          },
                          style: TextStyle(color: AppColors.pinkBackground),
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
                                borderSide:
                                    BorderSide(color: AppColors.pinkBackground),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.pinkBackground),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.pinkBackground),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.pinkBackground),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                            suffixIcon: IconButton(
                              color: AppColors.pinkBackground,
                              icon: const Icon(
                                Icons.search,
                              ),
                              onPressed: () {
                                String textFormarter =
                                    _pesquisa.text.replaceAll(' ', '');
                                if (_pesquisa.text.isNotEmpty) {
                                  _controller.getPokemonByName(
                                      textFormarter.toLowerCase());
                                } else {
                                  _controller.getData('');
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(
                            context,
                            '/favorit',
                          ),
                        },
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
                                  color: _controller.theme,
                                  onTap: () {
                                    Navigator.pushNamed(context, '/details',
                                        arguments:
                                            pokemons[index].idPokemon);
                                  },
                                );
                              }),
                            ),
                          );
                        },
                        loading: () {
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 250),
                            child: Center(
                              child: Column(
                                children: [
                                  CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.pinkBackground,
                                    ),
                                  ),
                                  const Text('Carregando...')
                                ],
                              ),
                            ),
                          );
                        },
                        error: (message, _) {
                          return const NoSearch();
                        },
                        orElse: () => Container(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {},
            child: GestureDetector(
              onTap: () {
                _controller.getData('${_controller.dataResult.length}');
              },
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_drop_down_circle,
                    color: AppColors.pinkBackground,
                    size: 30,
                  ),
                  Text(
                    'Ver Mais',
                    style: GoogleFonts.poppins(
                        fontSize: 10, color: AppColors.pinkBackground),
                  )
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
