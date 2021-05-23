import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';

class Footer extends StatefulWidget{
  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer>{

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(ResponsiveLayout.isSmallScreen(context))
      return Padding(
        padding: EdgeInsets.only(top:size.width*0.05,bottom: size.width*0.05,right: size.width*0.035,left: size.width*0.035),
        child: Column(
          children: [
            Text("Location",
              style: GoogleFonts.vollkorn(
                color:  Colors.white,
                textStyle: Theme.of(context).textTheme.title,
                fontSize: size.width*0.1,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.width*0.05,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
              ),
              child: Text("112, Mahalaxmi Nagar, Opp. Jatra Hotel, Adgoan Shivar, Nashik - 422003",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            SizedBox(
              height: size.width*0.1,
            ),
            Text("Contact",
              style: GoogleFonts.vollkorn(
                color:  Colors.white,
                textStyle: Theme.of(context).textTheme.title,
                fontSize: size.width*0.1,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height*0.015,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
              ),
              child: Text("spenter101@gmail.com",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
              ),
              child: Text("+918208063459",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            SizedBox(
              height: size.width*0.1,
            ),
            Text("Connect Us",
              style: GoogleFonts.vollkorn(
                color:  Colors.white,
                textStyle: Theme.of(context).textTheme.title,
                fontSize: size.width*0.1,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height*0.015,
            ),
            Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.8,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Icon(
                    CupertinoIcons.circle_grid_hex_fill,
                    size: size.height*0.04,
                    color: Colors.white,
                  ),
                )
            ),
            SizedBox(
              height: size.width*0.1,
            ),
            Text("About Us",
              style: GoogleFonts.vollkorn(
                color:  Colors.white,
                textStyle: Theme.of(context).textTheme.title,
                fontSize: size.width*0.1,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height*0.015,
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.8,
              ),
              child: Text("We are manufacturers' of fresh IDLI/DOSA, UTTAPPA, Meduvada batter",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 4,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.05,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
          ],
        ),
      );
    else
      return Padding(
        padding: EdgeInsets.only(top:size.height*0.05,bottom: size.height*0.05,right: size.width*0.1,left: size.width*0.1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Location",
                  style: GoogleFonts.vollkorn(
                    color:  Colors.white,
                    textStyle: Theme.of(context).textTheme.title,
                    fontSize: size.height*0.04,
                    fontWeight: FontWeight.w300,
                  ),
                ),
               SizedBox(
                 height: size.height*0.015,
               ),
               Container(
                 constraints: BoxConstraints(
                   maxWidth: size.width * 0.25,
                 ),
                 child: Text("112, Mahalaxmi Nagar, Opp. Jatra Hotel, Adgoan Shivar, Nashik - 422003",
                   textAlign: TextAlign.center,
                   overflow: TextOverflow.ellipsis,
                   maxLines: 2,
                   style: GoogleFonts.openSans(
                     color:  Colors.white,
                     textStyle: Theme.of(context).textTheme.body1,
                     fontSize: size.height*0.025,
                     fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height*0.1,
                ),
                Text("Contact",
                  style: GoogleFonts.vollkorn(
                    color:  Colors.white,
                    textStyle: Theme.of(context).textTheme.title,
                    fontSize: size.height*0.04,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: size.height*0.015,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.25,
                  ),
                  child: Text("spenter101@gmail.com",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      color:  Colors.white,
                      textStyle: Theme.of(context).textTheme.body1,
                      fontSize: size.height*0.025,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.25,
                  ),
                  child: Text("+918208063459",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      color:  Colors.white,
                      textStyle: Theme.of(context).textTheme.body1,
                      fontSize: size.height*0.025,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text("Connect Us",
                  style: GoogleFonts.vollkorn(
                    color:  Colors.white,
                    textStyle: Theme.of(context).textTheme.title,
                    fontSize: size.height*0.04,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: size.height*0.015,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.25,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(
                      CupertinoIcons.circle_grid_hex_fill,
                      size: size.height*0.04,
                      color: Colors.white,
                    ),
                  )
                ),
              ],
            ),
            Column(
              children: [
                Text("About Us",
                  style: GoogleFonts.vollkorn(
                    color:  Colors.white,
                    textStyle: Theme.of(context).textTheme.title,
                    fontSize: size.height*0.04,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: size.height*0.015,
                ),
                Container(
                  constraints: BoxConstraints(
                    maxWidth: size.width * 0.25,
                  ),
                  child: Text("We are manufacturers' of fresh IDLI/DOSA, UTTAPPA, Meduvada batter",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                      color:  Colors.white,
                      textStyle: Theme.of(context).textTheme.body1,
                      fontSize: size.height*0.025,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}