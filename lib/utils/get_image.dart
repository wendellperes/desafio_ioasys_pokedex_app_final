class GetImagePokemon {
  // ignore: non_constant_identifier_names
  static  PokemonFrontHome(int id) {
    if (id > 0) {
      return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";
    }
    return "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png";
  }
}
