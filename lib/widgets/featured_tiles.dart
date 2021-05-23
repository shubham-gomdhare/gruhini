import 'package:flutter/material.dart';
import 'package:gruhini/util/responsiveLayout.dart';

class FeaturedTiles extends StatelessWidget {
  FeaturedTiles({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final height,width;

  final List<String> assets = [
    'assets/gruhini/pack_1.jpg',
    'assets/gruhini/pack_2.jpg',
  ];

  final List<String> title = ['IDLI/DOSA BATTER', 'MEDU-VADA BATTER', ];

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: EdgeInsets.only(top: 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width / 15),
                  ...Iterable<int>.generate(assets.length).map(
                    (int pageIndex) => Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: height*0.74,
                              width: width / 1.5,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5.0),
                                child: Image.asset(
                                  assets[pageIndex],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: height *0.05,
                              ),
                              child: Text(
                                title[pageIndex],
                                style: TextStyle(
                                  fontSize: width * 0.035,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width / 15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
