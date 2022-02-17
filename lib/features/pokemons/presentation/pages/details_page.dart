
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({ Key? key }) : super(key: key);

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
            child: Image.asset('images/pokeball.png')
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => Navigator.pop(context), 
                  icon: Icon(Icons.arrow_back, color: AppColors.whiteBackground, size: 33,)
                ),
                Text(
                  'Pokemon Name', 
                  style: GoogleFonts.poppins(
                    color: AppColors.whiteBackground,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal
                  ),
                ),
                Text(
                  '#001', 
                  style: GoogleFonts.poppins(
                    color: AppColors.whiteBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.27, left: 10, right: 10),
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              color: AppColors.whiteBackground,
              borderRadius: BorderRadius.circular(25)
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            isFavorit = !isFavorit;
                          });
                        }, 
                        icon: isFavorit ? Icon(
                          Icons.favorite,
                          size: 33,
                          color: AppColors.pinkBackground,
                        )
                        : Icon(
                          Icons.favorite_outline, 
                          color: AppColors.pinkBackground, 
                          size: 33,
                        )
                      )
                    ],
                  ),
                ),
                Text('data')
              ],
            ),
            ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Image.network(
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png",
              scale: 2,
            ),
          ),
          
          
        ],
      ),
    );
  }
}