import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';

class DestinationCarousel extends StatefulWidget {
  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final String imagePath = 'assets/images/';

  final CarouselController _controller = CarouselController();

  List _isHovering = [false, false, false, false,];
  List _isSelected = [true, false, false, false, ];

  int _current = 0;

  final List<String> images = [
    'assets/gruhini/idli.jpg',
    'assets/gruhini/dosa.jpg',
    'assets/gruhini/uttapa.jpg',
    'assets/gruhini/medu.jpg',
  ];

  final List<String> places = [
    ' IDLI BATTER ',
    ' DOSA BATTER ',
    ' UTTAPA BATTER ',
    ' MEDU-VADA BATTER ',
  ];

  List<Widget> generateImageTiles(screenSize) {
    return images
        .map(
          (element) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
          child: Image.asset(
            element,
            fit: BoxFit.cover,
        ),
      ),
    )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var imageSliders = generateImageTiles(screenSize);

    return Stack(
      children: [
        CarouselSlider(
          items: imageSliders,
          options: CarouselOptions(
              enlargeCenterPage: true,
              aspectRatio: 18 / 8,
              autoPlay: true,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                  for (int i = 0; i < imageSliders.length; i++) {
                    if (i == index) {
                      _isSelected[i] = true;
                    } else {
                      _isSelected[i] = false;
                    }
                  }
                });
              }),
          carouselController: _controller,
        ),
        AspectRatio(
          aspectRatio: 18 / 8,
          child: Center(
            child: Text(
              places[_current],
              style: GoogleFonts.openSans(
                color: Color(0xFFE0E5EC),
                letterSpacing: 8,
                textStyle: Theme.of(context).textTheme.headline1,
                fontSize: screenSize.width / 25,
                fontWeight: FontWeight.w700,
                backgroundColor: Colors.black38.withOpacity(0.2),
              ),
            ),
          ),
        ),
        ResponsiveLayout.isSmallScreen(context)
            ? Container()
            : AspectRatio(
          aspectRatio: 17 / 8,
          child: Center(
            heightFactor: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  left: screenSize.width / 8,
                  right: screenSize.width / 8,
                ),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: screenSize.height / 50,
                      bottom: screenSize.height / 50,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < places.length; i++)
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                onHover: (value) {
                                  setState(() {
                                    value
                                        ? _isHovering[i] = true
                                        : _isHovering[i] = false;
                                  });
                                },
                                onTap: () {
                                  _controller.animateToPage(i);
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      top: screenSize.height / 80,
                                      bottom: screenSize.height / 90),
                                  child: Text(
                                    places[i],
                                    style: TextStyle(
                                      color: _isHovering[i]
                                          ? Colors.blueGrey[900]
                                          : Colors.blueGrey,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: _isSelected[i],
                                child: AnimatedOpacity(
                                  duration: Duration(milliseconds: 400),
                                  opacity: _isSelected[i] ? 1 : 0,
                                  child: Container(
                                    height: 5,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    width: screenSize.width / 10,
                                  ),
                                ),
                              )
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
