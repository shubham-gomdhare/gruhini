import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';
import 'package:gruhini/widgets/courosel.dart';
import 'package:gruhini/widgets/form.dart' as f;
import 'package:gruhini/widgets/navbar.dart';


void main() => runApp(
        MaterialApp(
          title: 'GRUHINI',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
      )
    );

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xFFF8FBFF),
            Color(0xFFFCFDFD),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[NavBar(), Body()],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      largeScreen: LargeChild(),
      mediumScreen: LargeChild(),
      smallScreen: SmallChild(),
    );
  }
}

class LargeChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.9],
                colors: [
                  Color(0xff570ec0),
                  Color(0xff3af2fe),
                ],
                // stops: [0.0, 0.1],
              ),
            ),
            height: size.height - 90,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.1,
                    bottom: size.height * 0.05,
                    right: size.height * 0.015,
                    left: size.height * 0.015,
                  ),
                  child: SizedBox(
                    height: size.height * 0.45,
                    width: size.width,
                    child: Image.asset(
                      'assets/gruhini/banner.jpg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width*0.005,
                ),
                Text("G R U H I N I   F O O D   P R O D U C T S",
                  style: GoogleFonts.jacquesFrancois(
                    color: Color(0xFFE0E5EC),
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: size.width*0.035,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black38.withOpacity(0.2),
                  ),
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                Container(
                  width: size.width*0.75,
                  child: Divider(
                    thickness: size.width*0.001,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE0E5EC),
            ),
            height: size.height * 1.25,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.width*0.01,
                ),
                ClayContainer(
                  emboss: true,
                  color: Color(0xFFE0E5EC),
                  borderRadius: 50,
                  child: Padding(
                    padding: EdgeInsets.all(size.width*0.01),
                    child: Text("  O U R   P R O D U C T S  ",
                      style: GoogleFonts.imFellDoublePica(
                        color:  Color(0xFF3023AE),
                        textStyle: Theme.of(context).textTheme.headline1,
                        fontSize: size.width*0.02,
                        fontWeight: FontWeight.w300,
                      ),
                      //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                    ),
                  )
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                Container(
                  width: size.width*0.75,
                  child: Divider(
                    thickness: size.width*0.001,
                    color:  Color(0xFF3023AE),
                  ),
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                DestinationCarousel(),
                SizedBox(
                  height: size.width*0.002,
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFE0E5EC),
            height: size.height ,
             child: Column(
               children: [
                 ClayContainer(
                     emboss: true,
                     color: Color(0xFFE0E5EC),
                     borderRadius: 50,
                     child: Padding(
                       padding: EdgeInsets.all(size.width*0.01),
                       child: Text("  O R D E R   N O W  ",
                         style: GoogleFonts.imFellDoublePica(
                           color:  Color(0xFF3023AE),
                           textStyle: Theme.of(context).textTheme.headline1,
                           fontSize: size.width*0.02,
                           fontWeight: FontWeight.w300,
                         ),
                         //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                       ),
                     )
                 ),
                 SizedBox(
                   height: size.width*0.02,
                 ),
                 f.Form_()
               ],
             ),
          ),
        ],
      ),
    );
  }
}

class SmallChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // Add one stop for each color. Stops should increase from 0 to 1
                stops: [0.1, 0.9],
                colors: [
                  Color(0xff570ec0),
                  Color(0xff3af2fe),
                ],
                // stops: [0.0, 0.1],
              ),
            ),
            height: size.height - 90,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.1,
                    bottom: size.width * 0.0,
                    right: size.width * 0.04,
                    left: size.width * 0.04,
                  ),
                  child: SizedBox(
                    height: size.height * 0.45,
                    width: size.width,
                    child: Image.asset(
                      'assets/gruhini/banner.jpg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.width*0.0,
                ),
                Text("✦  G R U H I N I   F O O D  ✦",
                  style: GoogleFonts.jacquesFrancois(
                    color: Color(0xFFE0E5EC),
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: size.width*0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                ),
                Text("P R O D U C T S",
                  style: GoogleFonts.jacquesFrancois(
                    color: Color(0xFFE0E5EC),
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: size.width*0.07,
                    fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                Container(
                  width: size.width*0.85,
                  child: Divider(
                    thickness: size.width*0.005,
                    color: Colors.white,
                  ),
                ),
                Text("Housewives' First Choice",
                  style: GoogleFonts.roboto(
                    color: Color(0xFFE0E5EC),
                    textStyle: Theme.of(context).textTheme.subtitle1,
                    fontSize: size.width*0.05,
                    fontWeight: FontWeight.normal,
                  ),
                  //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE0E5EC),
            ),
            height: size.height*0.4,
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.width*0.05,
                ),
                ClayContainer(
                    emboss: true,
                    color: Color(0xFFE0E5EC),
                    borderRadius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(size.width*0.02),
                      child: Text("✦  O U R   P R O D U C T S  ✦",
                        style: GoogleFonts.imFellDoublePica(
                          color:  Color(0xFF3023AE),
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: size.width*0.045,
                          fontWeight: FontWeight.w300,
                        ),
                        //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                      ),
                    )
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                Container(
                  width: size.width*0.75,
                  child: Divider(
                    thickness: size.width*0.001,
                    color:  Color(0xFF3023AE),
                  ),
                ),
                SizedBox(
                  height: size.width*0.002,
                ),
                DestinationCarousel(),
              ],
            ),
          ),
          Container(
            color: Color(0xFFE0E5EC),
            height: size.height * 1.65,
            width:size.width,
            child: Column(
              children: [
                SizedBox(
                  height: size.width*0.04,
                ),
                ClayContainer(
                    emboss: true,
                    color: Color(0xFFE0E5EC),
                    borderRadius: 50,
                    child: Padding(
                      padding: EdgeInsets.all(size.width*0.02),
                      child: Text("  O R D E R   N O W  ",
                        style: GoogleFonts.imFellDoublePica(
                          color:  Color(0xFF3023AE),
                          textStyle: Theme.of(context).textTheme.headline1,
                          fontSize: size.width*0.045,
                          fontWeight: FontWeight.w300,
                        ),
                        //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                      ),
                    )
                ),
                SizedBox(
                  height: size.width*0.04,
                ),
                f.Form_()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
