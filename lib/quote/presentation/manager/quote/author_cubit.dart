import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quote_app/quote/presentation/manager/quote/author_state.dart';

import '../../../../networking/apis.dart';
import '../../../data/models/author.dart';

class AuthorCubit extends Cubit<AuthorState>{
  AuthorCubit(super.InitAuthorState);

  Author? authorQuote;
  FocusNode searchFocus = FocusNode();
  TextEditingController searchController = TextEditingController();
  var box = Hive.box('author_box');



  void getAuthors({required String authorName}) async {
    emit(LoadingAuthorState());
    authorQuote = await Apis().getAuthorQuote(author: authorName);
    box.put('author', authorQuote);

    print('data : ${authorQuote?.id}');
    emit(LoadedSuccessAuthorState(author: authorQuote));
  }
}