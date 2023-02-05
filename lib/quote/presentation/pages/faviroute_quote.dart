import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quote_app/quote/data/models/quote.dart';

class FaviroteQuotesPage extends StatefulWidget {
  FaviroteQuotesState createState ()=> FaviroteQuotesState();
}

class FaviroteQuotesState extends State<FaviroteQuotesPage>{


  @override
  void initState(){
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ValueListenableBuilder(
          valueListenable: Hive.box('favrouite_box').listenable(),
          builder: (BuildContext context, value, Widget? child) {
            print('value : ${value.values}');

            return Container();
            // Quote quote = value.
          },

        ),
      ),
    );
  }

}