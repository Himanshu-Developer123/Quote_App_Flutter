import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quote_app/quote/presentation/manager/quote/search_state.dart';

import '../../../../networking/apis.dart';
import '../../../data/models/quote.dart';

class SearchCubit extends Cubit<SearchState>{
  SearchCubit(super.SearchState);

  List<Quote> quotes = [];
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocus = FocusNode();


  void getQuotes({required String query,int? limit}) async {
    emit(LoadingSearchState());
    quotes = (await Apis().searchQuote(query: query)) ?? <Quote>[];


    // print('data : ${authorQuote?.id}');
    print('quotes : ${quotes.length}');
    emit(LoadedSuccessSearchState(searchQuotes: quotes));
  }
}