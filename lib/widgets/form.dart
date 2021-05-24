import 'dart:convert';

import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gruhini/util/responsiveLayout.dart';
import 'package:gruhini/widgets/featured_tiles.dart';
import 'package:url_launcher/url_launcher.dart';
class Form_ extends StatefulWidget{
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form_>{


  bool isNameValidate = false;
  bool isMobileValidate = false;
  bool isAddressValidate = false;



  TextEditingController nameController = new TextEditingController();
  TextEditingController mobileController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();



  final _formKey = GlobalKey();
  bool _b1 = false;
  bool _b2 = false;
  int _b1_count = 1;
  int _b2_count = 1;
  int _b1_cost = 50;
  int _b2_cost = 60;
  int total = 0;

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Place order on mobile phones!')));
  }

  void whatsAppOpen(Map<String,dynamic> msg) async {

    String body =
        "Name: "+ msg['name'].toString() + "%0a" +
        "Mobile: " + msg['mobile'].toString() + "%0a" +
        "Address: " + msg['address'].toString() + "%0a" +
        "Idli Batter: " +msg['idli'].toString() + " KG" +  "%0a" +
        "Medu-vada Batter: " +msg['meduvada'].toString() + " KG" +  "%0a" +
        "Total: " + msg['total'].toString() + "%0a" ;



    var whatsappUrl ="whatsapp://send?phone=+918208063459&text=$body";
    try {
      await launch(whatsappUrl);
      //await canLaunch(whatsappUrl)? launch(whatsappUrl):_showDialog(this.context);
    }catch(e){
      print(e.toString());
    }

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(ResponsiveLayout.isSmallScreen(context))
    return Container(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Color(0xFFE0E5EC),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                  ),]
              ),
              height: (!_b1 && !_b2)?size.height * 0.8:(_b1 && _b2)?size.height:size.height * 0.9,
              width: size.width *0.9,
              child: Padding(
                padding: EdgeInsets.all(size.height*0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.width*0.035,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.12,
                      width: size.width *0.8,
                      child: TextField(
                        style: TextStyle(fontSize: size.width*0.04),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Name',
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isNameValidate ? 'Please enter your Name!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.035,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.12,
                      width: size.width *0.8,
                      child: TextField(
                        style: TextStyle(fontSize: size.width*0.04),
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Mobile',
                          hintText: 'Mobile',
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isMobileValidate ? 'Please enter your Mobile No.!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.035,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.12,
                      width: size.width *0.8,
                      child: TextField(
                        style: TextStyle(fontSize: size.width*0.04),
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          hintText: 'Address',
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isAddressValidate ? 'Please enter your Address!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.035,
                    ),
                    ClayContainer(
                      borderRadius: 15,
                      color: Color(0xFFE0E5EC),
                      height: (!_b1)?size.width*0.25:size.width*0.45,
                      width: size.width *0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Fresh Idli/Dosa Batter",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.025,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(_b1){
                                setState(() {
                                  _b1 = false;
                                  total = total - _b1_cost;
                                });
                              }else{
                                setState(() {
                                  _b1 = true;
                                  total = total + _b1_cost;
                                });
                              }
                            },
                            child: ClayContainer(
                                color: Color(0xFFE0E5EC),
                                borderRadius: 15,
                                emboss: (_b1)?true:false,
                                height: 40,
                                width: (!_b1)?120:80,
                                child: (_b1)? Center(
                                  child: Text("Added",
                                    style: GoogleFonts.openSans(
                                      color:  Colors.green,
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ): Center(
                                  child: Text("Add to Cart",
                                    style: GoogleFonts.openSans(
                                      color:  Color(0xFF3023AE),
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.022,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          (_b1)?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(_b1_count>1){
                                    setState(() {
                                      _b1_count--;
                                      _b1_cost = _b1_cost - 50;
                                      total = total - 50;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:10,
                              ),
                              ClayContainer(
                                  color: Color(0xFFE0E5EC),
                                  borderRadius: 15,
                                  emboss: (_b1)?true:false,
                                  height: 40,
                                  width: 100,
                                  child: Center(
                                    child: Text(_b1_count.toString()+" KG",
                                      style: GoogleFonts.openSans(
                                        color:  Colors.green,
                                        textStyle: Theme.of(context).textTheme.title,
                                        fontSize: size.height*0.022,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(
                                width:10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _b1_count++;
                                    _b1_cost = _b1_cost + 50;
                                    total = total + 50;
                                  });
                                },
                                child : Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_right,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ):Container(),
                          (!_b1)?
                          Text("₹50/kg",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ):Text(_b1_count.toString()+" X 50 =  ₹ "+_b1_cost.toString(),
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.04,
                    ),
                    ClayContainer(
                      borderRadius: 15,
                      color: Color(0xFFE0E5EC),
                      height: (!_b2)?size.width*0.25:size.width*0.45,
                      width: size.width *0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Fresh Medu-Vada Batter",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.025,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(_b2){
                                setState(() {
                                  _b2 = false;
                                  total = total - _b2_cost;
                                });
                              }else{
                                setState(() {
                                  _b2 = true;
                                  total = total + _b2_cost;
                                });
                              }
                            },
                            child: ClayContainer(
                                color: Color(0xFFE0E5EC),
                                borderRadius: 15,
                                emboss: (_b2)?true:false,
                                height: 40,
                                width: (!_b2)?120:80,
                                child: (_b2)? Center(
                                  child: Text("Added",
                                    style: GoogleFonts.openSans(
                                      color:  Colors.green,
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ): Center(
                                  child: Text("Add to Cart",
                                    style: GoogleFonts.openSans(
                                      color:  Color(0xFF3023AE),
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.022,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          (_b2)?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(_b2_count>1){
                                    setState(() {
                                      _b2_count--;
                                      _b2_cost = _b2_cost - 60;
                                      total = total - 60;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:10,
                              ),
                              ClayContainer(
                                  color: Color(0xFFE0E5EC),
                                  borderRadius: 15,
                                  emboss: (_b2)?true:false,
                                  height: 40,
                                  width: 100,
                                  child: Center(
                                    child: Text(_b2_count.toString()+" KG",
                                      style: GoogleFonts.openSans(
                                        color:  Colors.green,
                                        textStyle: Theme.of(context).textTheme.title,
                                        fontSize: size.height*0.022,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(
                                width:10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _b2_count++;
                                    _b2_cost = _b2_cost + 60;
                                    total = total + 60;
                                  });
                                },
                                child : Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_right,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ):Container(),
                          (!_b2)?
                          Text("₹60/kg",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ):Text(_b2_count.toString()+" X 60 =  ₹ "+_b2_cost.toString(),
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.03,
                    ),
                    (_b1 || _b2)?
                    Text("Grand Total :  ₹ "+total.toString(),
                      style: GoogleFonts.roboto(
                        color:  Color(0xFF3023AE),
                        textStyle: Theme.of(context).textTheme.title,
                        fontSize: size.height*0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ):Container(),
                    SizedBox(
                      height: size.width*0.02,
                    ),
                    Text("*Free delivery on orders more than 5 KGs'.",
                      style: GoogleFonts.openSans(
                        color:  Colors.blueGrey,
                        textStyle: Theme.of(context).textTheme.title,
                        fontSize: size.height*0.015,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: size.width*0.02,
                    ),
                    InkWell(
                      onTap: () async {
                        if( validateName(nameController.text) &&
                            validateMobile(mobileController.text) &&
                            validateAddress(addressController.text)){
                          if(_b1 || _b2 ){
                            if(_b1_cost == 0){
                              setState(() {
                                _b1_count = 0;
                              });
                            }
                            if(_b2_cost == 0){
                              setState(() {
                                _b2_count = 0;
                              });
                            }
                            Map<String,dynamic> msg = {
                              "name" : nameController.text,
                              "mobile" : mobileController.text,
                              "address" : addressController.text,
                              "idli" : _b1_count,
                              "meduvada" : _b2_count,
                              "total" : total,
                            };
                            whatsAppOpen(msg);
                          }else{
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              duration: Duration(seconds: 2) ,
                              content: new Text("Add Items to Cart!"),
                            ),
                            );
                          }

                        }
                      },
                      child: Container(
                        height: size.width*0.1,
                        width: size.width *0.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, offset: Offset(0, 3), blurRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Color(0xFFC86DD7), Color(0xFF3023AE)]),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Place Order',
                              style: TextStyle(
                                  fontSize: size.width*0.045,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              )
          ),
          SizedBox(
            height: size.width*0.05,
          ),
          Container(
            decoration: BoxDecoration(
                color: Color(0xFFE0E5EC),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                ),]
            ),
            height: size.height * 0.5,
            width: size.width *0.9,
            child: Padding(
              padding: EdgeInsets.only(top: (size.width * 0.1)),
              child: FeaturedTiles(height:size.height * 0.5,width: size.width *0.9),
            ),
          ),
        ],
      ),
    );
    else
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ClayContainer(
            color: Color(0xFFE0E5EC),
            emboss: true,
            borderRadius: 15,
            height: size.height * 0.8,
            width: size.width *0.4,
            child: Padding(
              padding: EdgeInsets.only(top: (size.height * 0.7)*0.15),
              child: FeaturedTiles(height:size.height * 0.7,width: size.width *0.48),
            ),
          ),
          ClayContainer(
              color: Color(0xFFE0E5EC),
              emboss: true,
              borderRadius: 15,
              height: size.height * 0.8,
              width: size.width *0.56,
              child: Padding(
                padding: EdgeInsets.all(size.height*0.02),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.04,
                      width: size.width *0.4,
                      child: TextField(
                        style: TextStyle(fontSize: size.height*0.03),
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Name',
                          labelStyle: TextStyle(fontSize: size.height*0.02,color:  Color(0xFF3023AE)),
                          hintStyle: TextStyle(fontSize: size.height*0.03,color: Colors.black54.withOpacity(.5)),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isNameValidate ? 'Please enter your Name!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.04,
                      width: size.width *0.4,
                      child: TextField(
                        style: TextStyle(fontSize: size.height*0.03),
                        controller: mobileController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Mobile',
                          hintText: 'Mobile',
                          labelStyle: TextStyle(fontSize: size.height*0.02,color:  Color(0xFF3023AE)),
                          hintStyle: TextStyle(fontSize: size.height*0.03,color: Colors.black54.withOpacity(.5)),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isMobileValidate ? 'Please enter your Mobile No.!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    ClayContainer(
                      color: Color(0xFFE0E5EC),
                      emboss: false,
                      borderRadius: 15,
                      height: size.width*0.05,
                      width: size.width *0.4,
                      child: TextField(
                        style: TextStyle(fontSize: size.height*0.03),
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: 'Address',
                          hintText: 'Address',
                          labelStyle: TextStyle(fontSize: size.height*0.02,color:  Color(0xFF3023AE)),
                          hintStyle: TextStyle(fontSize: size.height*0.03,color: Colors.black54.withOpacity(.5)),
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          border: InputBorder.none,
                          errorText: isAddressValidate ? 'Please enter your Address!' : null,
                          contentPadding: EdgeInsets.only(
                              top: 0, right: 0, left: size.width*0.03, bottom: 0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      height: size.width*0.03,
                      width: size.width *0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Fresh Idli/Dosa Batter:  ",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.025,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(_b1){
                                setState(() {
                                  _b1 = false;
                                  total = total - _b1_cost;
                                });
                              }else{
                                setState(() {
                                  _b1 = true;
                                  total = total + _b1_cost;
                                });
                              }
                            },
                            child: ClayContainer(
                                color: Color(0xFFE0E5EC),
                                borderRadius: 15,
                                emboss: (_b1)?true:false,
                                height: 40,
                                width: (!_b1)?120:80,
                                child: (_b1)? Center(
                                  child: Text("Added",
                                    style: GoogleFonts.openSans(
                                      color:  Colors.green,
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ): Center(
                                  child: Text("Add to Cart",
                                    style: GoogleFonts.openSans(
                                      color:  Color(0xFF3023AE),
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.022,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          (_b1)?
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(_b1_count>1){
                                    setState(() {
                                      _b1_count--;
                                      _b1_cost = _b1_cost - 50;
                                      total = total - 50;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:10,
                              ),
                              ClayContainer(
                                  color: Color(0xFFE0E5EC),
                                  borderRadius: 15,
                                  emboss: (_b1)?true:false,
                                  height: 40,
                                  width: 100,
                                  child: Center(
                                    child: Text(_b1_count.toString()+" KG",
                                      style: GoogleFonts.openSans(
                                        color:  Colors.green,
                                        textStyle: Theme.of(context).textTheme.title,
                                        fontSize: size.height*0.022,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                              ),
                              SizedBox(
                                width:10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _b1_count++;
                                    _b1_cost = _b1_cost + 50;
                                    total = total + 50;
                                  });
                                },
                                child : Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_right,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ):Container(),
                          (!_b1)?
                          Text("₹50/kg",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ):Text("=  ₹ "+_b1_cost.toString(),
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    Container(
                      height: size.width*0.03,
                      width: size.width *0.5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Fresh Medu-Vada Batter:  ",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.025,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              if(_b2){
                                setState(() {
                                  _b2 = false;
                                  total = total - _b2_cost;
                                });
                              }else{
                                setState(() {
                                  _b2 = true;
                                  total = total + _b2_cost;
                                });
                              }
                            },
                            child: ClayContainer(
                                color: Color(0xFFE0E5EC),
                                borderRadius: 15,
                                emboss: (_b2)?true:false,
                                height: 40,
                                width: (!_b2)?120:80,
                                child: (_b2)? Center(
                                  child: Text("Added",
                                    style: GoogleFonts.openSans(
                                      color:  Colors.green,
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.02,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ): Center(
                                  child: Text("Add to Cart",
                                    style: GoogleFonts.openSans(
                                      color:  Color(0xFF3023AE),
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.022,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                )
                            ),
                          ),
                          (_b2)?
                          Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  if(_b2_count>1){
                                    setState(() {
                                      _b2_count--;
                                    });
                                  }
                                  if(_b2_cost>60){
                                    setState(() {
                                      _b2_cost = _b2_cost - 60;
                                      total = total - 60;
                                    });
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_left,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:10,
                              ),
                              ClayContainer(
                                color: Color(0xFFE0E5EC),
                                borderRadius: 15,
                                emboss: (_b1)?true:false,
                                height: 40,
                                width: 100,
                                child: Center(
                                  child: Text(_b2_count.toString()+" KG",
                                    style: GoogleFonts.openSans(
                                      color:  Colors.green,
                                      textStyle: Theme.of(context).textTheme.title,
                                      fontSize: size.height*0.022,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width:10,
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    _b2_count++;
                                    _b2_cost = _b2_cost + 60;
                                    total = total + 60;
                                  });
                                },
                                child : Container(
                                  decoration: BoxDecoration(
                                      color: Color(0xFFE0E5EC),
                                      shape: BoxShape.circle,
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),]
                                  ),
                                  height: 40,
                                  width: 40,
                                  child: Center(
                                    child: Icon(
                                      Icons.arrow_right,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ):Container(),
                          (!_b2)?
                          Text("₹60/kg",
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ):Text("=  ₹ "+_b2_cost.toString(),
                            style: GoogleFonts.roboto(
                              color:  Color(0xFF3023AE),
                              textStyle: Theme.of(context).textTheme.title,
                              fontSize: size.height*0.02,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    (_b1 || _b2)?
                    Text("Grand Total :  ₹ "+total.toString(),
                      style: GoogleFonts.roboto(
                        color:  Color(0xFF3023AE),
                        textStyle: Theme.of(context).textTheme.title,
                        fontSize: size.height*0.025,
                        fontWeight: FontWeight.w500,
                      ),
                    ):Container(),
                    SizedBox(
                      height: 18,
                    ),
                    Text("*Free delivery on orders more than 5 KGs'.",
                      style: GoogleFonts.openSans(
                        color:  Colors.blueGrey,
                        textStyle: Theme.of(context).textTheme.title,
                        fontSize: size.height*0.015,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    InkWell(
                      onTap: () async {
                        if( validateName(nameController.text) &&
                            validateMobile(mobileController.text) &&
                            validateAddress(addressController.text)){
                          if(_b1 || _b2 ){
                            if(_b1_cost == 0){
                              setState(() {
                                _b1_count = 0;
                              });
                            }
                            if(_b2_cost == 0){
                              setState(() {
                                _b2_count = 0;
                              });
                            }
                            Map<String,dynamic> msg = {
                              "name" : nameController.text,
                              "mobile" : mobileController.text,
                              "address" : addressController.text,
                              "idli" : _b1_count,
                              "meduvada" : _b2_count,
                              "total" : total
                            };
                            whatsAppOpen(msg);
                          }else{
                            Scaffold.of(context).showSnackBar(new SnackBar(
                              duration: Duration(seconds: 2) ,
                              content: new Text("Add Items to Cart!"),
                            ),
                            );
                          }

                        }
                      },
                      child: Container(
                        height: size.width*0.03,
                        width: size.width *0.25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey, offset: Offset(0, 3), blurRadius: 2)
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[Color(0xFFC86DD7), Color(0xFF3023AE)]),
                        ),
                        child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Place Order',
                              style: TextStyle(
                                  fontSize: size.height*0.03,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ),
                    ),
                  ],
                ),
              )
          )
        ],
      );
  }

  bool validateName(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isNameValidate = true;
      });
      return false;
    }
    setState(() {
      isNameValidate = false;
    });
    return true;
  }
  bool validateMobile(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isMobileValidate = true;
      });
      return false;
    }
    setState(() {
      isMobileValidate = false;
    });
    return true;
  }
  bool validateAddress(String userInput) {
    if (userInput.isEmpty) {
      setState(() {
        isAddressValidate = true;
      });
      return false;
    }
    setState(() {
      isAddressValidate = false;
    });
    return true;
  }

}