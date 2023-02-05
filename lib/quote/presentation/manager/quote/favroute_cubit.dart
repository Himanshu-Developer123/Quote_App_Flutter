import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../../networking/apis.dart';
import '../../../data/models/quote.dart';
import 'favroute_state.dart';

class FavrouteCubit extends Cubit<FavrouteState>{
  FavrouteCubit(super.FavrouteState);

  List<Quote> favQuotesList = [];

  var box = Hive.box('favrouite_box');



  void getAuthors({required String authorName}){
    Apis().getAuthorQuote(author: authorName);
  }

  void addFavroute(Quote quote){
    print('Added Data');
    box.add(quote);
  }

  void removeFav(int index){
    box.deleteAt(index);
  }
}