import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Products","Contact"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold",fontSize: 25)),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFE0E5EC),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: (!ResponsiveLayout.isSmallScreen(context))?140:size.width*0.05, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                ClayContainer(
                  width: 80,
                  height: 80,
                  borderRadius: 50,
                  child: Center(
                    child: Image.asset("assets/gruhini/logo.png",height: 72,width:72),
                  ),
                ),
                SizedBox(
                  width: 26,
                ),
                Text("",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                ),
              ],
            ),
            if (!ResponsiveLayout.isSmallScreen(context))
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    child: Text("Products", style: GoogleFonts.lato(
                      color: Color(0xFF3023AE),
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: size.width*0.012,
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  GestureDetector(
                    child: Text("Contact", style: GoogleFonts.lato(
                      color: Color(0xFF3023AE),
                      textStyle: Theme.of(context).textTheme.headline1,
                      fontSize: size.width*0.012,
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                ]..add(
                    InkWell(
                        child: ClayContainer(
                          //margin: EdgeInsets.only(left: 20),
                          borderRadius: 50,
                          width: 120,
                          height: 40,
                          color:Color(0xFFE0E5EC),
                          /*decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                                  begin: Alignment.bottomRight,
                                  end: Alignment.topLeft),
                              borderRadius: BorderRadius.circular(10),
                              ),*/
                          child: GestureDetector(
                            onTap: (){
                              print("LOGIN PRESSED");
                            },
                            child: Material(
                              color: Colors.transparent,
                              child: Center(
                                child: Text("LOGIN",
                                    style: GoogleFonts.lato(
                                      color: Color(0xFF3023AE),
                                      textStyle: Theme.of(context).textTheme.headline1,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w800,
                                    ),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ),
                ),
              )
            else
              Container(child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(left: 20),
                  width: size.width*0.25,
                  height: size.width*0.1,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xFFC86DD7), Color(0xFF3023AE)],
                          begin: Alignment.bottomRight,
                          end: Alignment.topLeft),
                      borderRadius: BorderRadius.circular(10),
                      ),
                  child: GestureDetector(
                    onTap: (){
                      print("Menu PRESSED");
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(CupertinoIcons.text_alignleft,size:size.width*0.05,color: Colors.white.withOpacity(0.7),),
                            Text("MENU",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: size.width*0.04,
                                    letterSpacing: 1,
                                    fontFamily: "Montserrat-Bold")
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ),
              )
              )

          ],
        ),
      ),
    );
  }
}
