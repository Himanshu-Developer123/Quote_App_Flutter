import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quote_app/quote/data/models/quote.dart';
import 'package:quote_app/quote/presentation/manager/quote/favroute_cubit.dart';
import 'package:quote_app/quote/presentation/manager/quote/search_state.dart';

import '../../data/models/author.dart';
import '../manager/quote/search_cubit.dart';

class SearchQuotesPage extends StatefulWidget {
  SearchQuotesState createState ()=> SearchQuotesState();
}

class SearchQuotesState extends State<SearchQuotesPage>{


  late SearchCubit searchCubit;
  late FavrouteCubit favrouteCubit;

  @override
  void initState(){
    super.initState();
    searchCubit = context.read<SearchCubit>();
    favrouteCubit = context.read<FavrouteCubit>();
  }

  @override
  void dispose(){
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        margin: EdgeInsets.all(15),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              width: size.width,
              height: size.height * 0.07,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      // width: size.width * 0.7,
                      height: size.height * 0.08,

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(90)),
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
                        child: TextField(
                          controller: searchCubit.searchController,
                          focusNode: searchCubit.searchFocus,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) async {
                            print('huhuhuhuh');
                            searchCubit.getQuotes(query: value);
                            // AuthorCubit.g(authorName: value);
                            // print("search");
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:10,top: 4),
                            border: InputBorder.none,
                            hintText: 'Enter Author Name',
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: searchCubit.searchFocus.hasFocus ? null : Icon(Icons.search),
                            suffixIcon: IconButton(
                              color: Colors.black, onPressed: () { searchCubit.searchController.clear(); }, icon: Icon(Icons.cancel),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  searchCubit.searchFocus.hasFocus ? Container(
                    width: size.width * 0.2,
                    height: size.height * 0.08,
                    child: Center(
                        child: Text('Cancel',style: TextStyle(fontSize: 14,color: Colors.white),)
                    ),
                  ) : SizedBox()
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03,),
            BlocBuilder<SearchCubit,SearchState>(
              builder: (context,state){
                if(state is LoadedSuccessSearchState){
                  List<Quote>? searchQuotes = state.searchQuotes;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: searchQuotes?.length,
                        itemBuilder: (context,index){
                        return Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(10),
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
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
                          child: Stack(
                            children: [
                              Positioned(
                                right:0,
                                  child: Icon(Icons.favorite,color: Colors.red,)
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text('Name : ${searchQuotes![index].author}')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          width:size.width * 0.8,
                                          child: Text('Content : ${searchQuotes![index].content}'))
                                    ],
                                  ),
                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //         width:size.width * 0.8,
                                  //         child: Text('Bio : ${author?.bio}'))
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text('Description : ${author?.description}')
                                  //   ],
                                  // ),
                                  // Row(
                                  //   children: [
                                  //     Text('quoteCount : ${author?.quoteCount}')
                                  //   ],
                                  // ),
                                  Row(
                                    children: [
                                      Text('dateAdded : ${searchQuotes![index].dateAdded}')
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('dateModified : ${searchQuotes![index].dateModified}')
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                        },
                    ),
                  );
                }
                if(state is LoadingSearchState){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is InitSearchState) {
                  var box = Hive.box('quotes_box');
                  // var searchQuotes = box.get('quotes')?.cast();
                  var response = box.get('quotes');
                  final Data = response != null ? response['results'] != null ? response['results'] as List<dynamic>? : null : null;
                  List<Quote>? searchQuotes = Data != null ?  Data?.map((e) => Quote().fromMap(e)).toList() : [];
                  if(searchQuotes != null && searchQuotes.isNotEmpty){
                    return Expanded(
                      child: ListView.builder(
                        itemCount: searchQuotes?.length,
                        itemBuilder: (context,index){
                          Quote quote1 = searchQuotes[index];
                          return Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(10),
                            width: size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20)),
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
                            child: Stack(
                              children: [
                                Positioned(
                                    right:0,
                                    child: IconButton(
                                      onPressed: (){
                                        favrouteCubit.addFavroute(quote1);
                                      },
                                      icon: Icon(Icons.favorite,color: Colors.red),)
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text('Name : ${searchQuotes![index].author}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            width:size.width * 0.8,
                                            child: Text('Content : ${searchQuotes![index].content}'))
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     Container(
                                    //         width:size.width * 0.8,
                                    //         child: Text('Bio : ${author?.bio}'))
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Text('Description : ${author?.description}')
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     Text('quoteCount : ${author?.quoteCount}')
                                    //   ],
                                    // ),
                                    Row(
                                      children: [
                                        Text('dateAdded : ${searchQuotes![index].dateAdded}')
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('dateModified : ${searchQuotes![index].dateModified}')
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return Container();
                  }

                }
                return SizedBox();
              },
            )

          ],
        ),
      ),
    );
  }

}