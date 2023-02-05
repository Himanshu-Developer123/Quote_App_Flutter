import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:quote_app/quote/presentation/manager/quote/author_cubit.dart';
import 'package:quote_app/quote/presentation/manager/quote/favroute_cubit.dart';
import 'package:quote_app/quote/presentation/manager/quote/search_cubit.dart';

import '../quote/presentation/manager/quote/author_state.dart';
import '../quote/presentation/manager/quote/favroute_state.dart';
import '../quote/presentation/manager/quote/search_state.dart';

class BlocProviders {
  static List<BlocProviderSingleChildWidget> providers =
  <BlocProviderSingleChildWidget>[
    BlocProvider(create: (context)=> AuthorCubit(InitAuthorState())),
    BlocProvider(create: (context)=> FavrouteCubit(const FavrouteState())),
    BlocProvider(create: (context)=> SearchCubit(InitSearchState()))
  ];
}
