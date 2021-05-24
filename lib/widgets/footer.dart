import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';
import 'package:url_launcher/url_launcher.dart';


class Footer extends StatefulWidget{
  @override
  FooterState createState() => FooterState();
}

class FooterState extends State<Footer>{

  void _launchURL(String _url) async =>
      await launch(_url);

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
                maxLines: 4,
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
                maxWidth: size.width * 0.85,
              ),
              child: Text("spenter101@gmail.com",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.048,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Container(
              constraints: BoxConstraints(
                maxWidth: size.width * 0.85,
              ),
              child: Text("+918208063459",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.openSans(
                  color:  Colors.white,
                  textStyle: Theme.of(context).textTheme.body1,
                  fontSize: size.width*0.048,
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
            GestureDetector(
              onTap: (){
                _launchURL('whatsapp://send?phone=+918208063459&text=Hello!!');
              },
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/gruhini/wa.png',
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
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
                GestureDetector(
                  onTap: (){
                    _launchURL('whatsapp://send?phone=+918208063459&text=Hello!!');
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 50,
                      width: 50,
                      child: Image.asset('assets/gruhini/wa.png',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
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