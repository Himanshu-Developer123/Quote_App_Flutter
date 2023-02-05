import 'package:equatable/equatable.dart';

import '../../../data/models/quote.dart';

class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class InitSearchState extends SearchState {

}

class LoadingSearchState extends SearchState {

}

class LoadedSuccessSearchState extends SearchState {
  List<Quote>? searchQuotes = [];
  LoadedSuccessSearchState({this.searchQuotes});
}

