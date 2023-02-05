import 'package:equatable/equatable.dart';
import 'package:quote_app/quote/data/models/author.dart';

class AuthorState extends Equatable {
  const AuthorState();

  @override
  List<Object> get props => [];
}

class InitAuthorState extends AuthorState {

}

class LoadingAuthorState extends AuthorState {

}

class LoadedSuccessAuthorState extends AuthorState {
  Author? author;
  LoadedSuccessAuthorState({this.author});
}

