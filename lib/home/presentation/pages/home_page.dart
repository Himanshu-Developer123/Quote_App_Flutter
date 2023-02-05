import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quote_app/networking/apis.dart';

import '../../../quote/presentation/pages/author_quote.dart';
import '../../../quote/presentation/pages/faviroute_quote.dart';
import '../../../quote/presentation/pages/search_quote.dart';

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin{

  /// Slide Right to Left Animation
  late final AnimationController _rtolController = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late final Animation<Offset> _rtolAnimation = Tween<Offset>(
    begin: const Offset(1, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _rtolController,
    // curve: Curves.fastLinearToSlowEaseIn,
    curve: Curves.easeOutCubic,
  ));

  /// Slide Left to Right Animation
  late final AnimationController _ltorController = AnimationController(
    duration: const Duration(seconds: 4),
    vsync: this,
  );
  late final Animation<Offset> _ltorAnimation = Tween<Offset>(
    begin: const Offset(-1, 0),
    end: const Offset(0, 0),
  ).animate(CurvedAnimation(
    parent: _ltorController,
    // curve: Curves.fastLinearToSlowEaseIn,
    curve: Curves.easeOutCubic,
  ));

  @override
  void initState(){
    super.initState();
    _rtolController.forward();
    _ltorController.forward();
  }


  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        width: size.width,
          height: size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  // Apis().getAuthorQuote(author: 'Einstein');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AuthorQuotesPage()));
                },
                child: SlideTransition(
                  position: _ltorAnimation,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    margin: EdgeInsets.only(top: 10,bottom: 10,right: 10),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomRight: Radius.circular(90)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(
                            1.0,
                            1.0,
                          ),
                          blurRadius: 10.0,
                          spreadRadius: 0.0,
                        ), //BoxShadow
                         //BoxShadow
                      ],
                    ),
                    child: Center(
                      child: Text('Author Quote',style: TextStyle(color: Colors.white,fontSize: 32),)
                      ,),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchQuotesPage()));
                },
                child: SlideTransition(
                  position: _rtolAnimation,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    margin: EdgeInsets.only(top: 10,bottom: 10,left: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                          //BoxShadow
                        ],
                        color: Colors.pink,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(90),bottomLeft: Radius.circular(90))
                    ),
                    child: Center(
                      child: Text('Search any Quote',style: TextStyle(color: Colors.white,fontSize: 32),)
                      ,),
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> FaviroteQuotesPage()));
                },
                child: SlideTransition(
                  position: _ltorAnimation,
                  child: Container(
                    width: size.width,
                    height: size.height * 0.2,
                    margin: EdgeInsets.only(top: 10,bottom: 10,right: 10),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 0.0,
                          ), //BoxShadow
                          //BoxShadow
                        ],
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(90),bottomRight: Radius.circular(90))
                    ),
                    child: Center(
                      child: Text('Favourite Quote',style: TextStyle(color: Colors.white,fontSize: 32),)
                      ,),
                  ),
                ),
              )
            ],
          ),
        ),
        ),
    );
  }
  
}