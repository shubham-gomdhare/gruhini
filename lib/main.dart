import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';
import 'package:gruhini/widgets/courosel.dart';
import 'package:gruhini/widgets/footer.dart';
import 'package:gruhini/widgets/form.dart' as f;
import 'package:gruhini/widgets/navbar.dart';
import 'package:url_launcher/url_launcher.dart';


void _launchURL(String _url) async =>
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';

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

class LargeChild extends StatefulWidget {
  @override
  LargeChildState createState() => LargeChildState();
}

class LargeChildState extends State<LargeChild> {

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      controller: _scrollController,
      physics: ClampingScrollPhysics(),
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
          Container(
            height: size.height*0.5,
            width: size.width,
            color: Color(0xFF283747),
            child: Center(
              child: Footer(),
            ),
          ),
          Container(
            height: size.width*0.001,
            width: size.width,
            color: Colors.red,
          ),
          Container(
            height: size.height*0.1,
            width: size.width,
            color: CupertinoColors.darkBackgroundGray,
            child: Center(
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.01,),
                    Text("This website designed by",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aleo(
                        color:  Colors.white,
                        textStyle: Theme.of(context).textTheme.body1,
                        fontSize: size.height*0.02,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        _launchURL('http://shubhamgomdhare.ml');
                      },
                      child: Text("SHUBHAM GOMDHARE.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.aleo(
                          color:  CupertinoColors.activeOrange,
                          textStyle: Theme.of(context).textTheme.body1,
                          fontSize: size.height*0.022,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height*0.005,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                            _launchURL('mailto:sgwthost@gmail.com');
                          },
                          child: Text("sgwthost@gmail.com  ",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color:  Colors.white,
                              textStyle: Theme.of(context).textTheme.body1,
                              fontSize: size.height*0.021,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                        Text("|",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color:  Colors.white,
                            textStyle: Theme.of(context).textTheme.body1,
                            fontSize: size.height*0.02,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            _launchURL('tel:+917057605444');
                          },
                          child: Text("  +917057605444",
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: GoogleFonts.roboto(
                              color:  Colors.white,
                              textStyle: Theme.of(context).textTheme.body1,
                              fontSize: size.height*0.021,
                              fontWeight: FontWeight.w100,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}

class SmallChild extends StatefulWidget {
  @override
  SmallChildState createState() => SmallChildState();
}

class SmallChildState extends State<SmallChild> {

  final ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      controller: _scrollController,
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
            height: size.height *0.7,
            width: size.width,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: size.width * 0.05,
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
                Text("  G R U H I N I   F O O D  ",
                  style: GoogleFonts.jacquesFrancois(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.headline1,
                    fontSize: size.width*0.072,
                    fontWeight: FontWeight.bold,
                  ),
                  //TextStyle(fontFamily: "",color: Colors.black54,fontSize: size.width*0.03)
                ),
                Text("P R O D U C T S",
                  style: GoogleFonts.jacquesFrancois(
                    color: Colors.white,
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
                    color: Color(0xFFE0E5EC),
                  ),
                ),
                Text("Housewives' First Choice",
                  style: GoogleFonts.roboto(
                    color: Colors.white,
                    textStyle: Theme.of(context).textTheme.subtitle1,
                    fontSize: size.width*0.05,
                    fontWeight: FontWeight.bold,
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
                      child: Text("  O U R   P R O D U C T S  ",
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
            height: size.height * 1.8,
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
          Container(
            height: size.height + 10,
            width: size.width,
            color: Color(0xFF283747),
            child: Center(
              child: Footer(),
            ),
          ),
          Container(
            height: size.width*0.001,
            width: size.width,
            color: Colors.red,
          ),
          Container(
            height: size.height*0.12,
            width: size.width,
            color: CupertinoColors.darkBackgroundGray,
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: size.width*0.02,),
                  Text("This website designed by",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.aleo(
                      color:  Colors.white,
                      textStyle: Theme.of(context).textTheme.body1,
                      fontSize: size.width*0.035,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  SizedBox(height: size.width*0.01,),
                  GestureDetector(
                    onTap: (){
                      _launchURL('http://shubhamgomdhare.ml');
                    },
                    child: Text("SHUBHAM GOMDHARE.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.aleo(
                        color:  CupertinoColors.activeOrange,
                        textStyle: Theme.of(context).textTheme.body1,
                        fontSize: size.width*0.04,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                  SizedBox(height: size.width*0.015,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          _launchURL('mailto:sgwthost@gmail.com');
                        },
                        child: Text("sgwthost@gmail.com  ",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            color:  Colors.white,
                            textStyle: Theme.of(context).textTheme.body1,
                            fontSize: size.width*0.035,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                      Text("|",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color:  Colors.white,
                          textStyle: Theme.of(context).textTheme.body1,
                          fontSize: size.width*0.035,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          _launchURL('tel:+917057605444');
                        },
                        child: Text("  +917057605444",
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.roboto(
                            color:  Colors.white,
                            textStyle: Theme.of(context).textTheme.body1,
                            fontSize: size.width*0.035,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
