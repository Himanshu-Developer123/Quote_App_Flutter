import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:quote_app/quote/data/models/author.dart';
import 'package:quote_app/quote/presentation/manager/quote/author_state.dart';

import '../manager/quote/author_cubit.dart';

class AuthorQuotesPage extends StatefulWidget {
  AuthorQuotesState createState ()=> AuthorQuotesState();
}

class AuthorQuotesState extends State<AuthorQuotesPage>{

  late AuthorCubit authorCubit;

  @override
  void initState(){
    super.initState();
    authorCubit = context.read<AuthorCubit>();
  }

  @override
  void dispose(){
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.orange,
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
                          controller: authorCubit.searchController,
                          focusNode: authorCubit.searchFocus,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) async {
                            print('huhuhuhuh');
                            authorCubit.getAuthors(authorName: value);
                            // AuthorCubit.g(authorName: value);
                            // print("search");
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:10,top: 4),
                            border: InputBorder.none,
                            hintText: 'Enter Author Name',
                            hintStyle: TextStyle(fontSize: 14),
                            prefixIcon: authorCubit.searchFocus.hasFocus ? null : Icon(Icons.search),
                            suffixIcon: IconButton(
                              color: Colors.black, onPressed: () { authorCubit.searchController.clear(); }, icon: Icon(Icons.cancel),),
                          ),
                        ),
                      ),
                    ),
                  ),
                  authorCubit.searchFocus.hasFocus ? Container(
                    width: size.width * 0.2,
                    height: size.height * 0.08,
                    child: Center(
                      child: Text('Cancel',style: TextStyle(fontSize: 14,color: Colors.white),)
                    ),
                  ) : SizedBox()
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1,),
            BlocBuilder<AuthorCubit,AuthorState>(
              builder: (context,state){
                if(state is LoadedSuccessAuthorState){
                  Author? author = state.author;
                  print('Author : ${author?.id}');
                  return Container(
                    padding: EdgeInsets.all(10),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Name : ${author?.name}')
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width:size.width * 0.8,
                                child: Text('Link : ${author?.link}'))
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                                width:size.width * 0.8,
                                child: Text('Bio : ${author?.bio}'))
                          ],
                        ),
                        Row(
                          children: [
                            Text('Description : ${author?.description}')
                          ],
                        ),
                        Row(
                          children: [
                            Text('quoteCount : ${author?.quoteCount}')
                          ],
                        ),
                        Row(
                          children: [
                            Text('dateAdded : ${author?.dateAdded}')
                          ],
                        ),
                        Row(
                          children: [
                            Text('dateModified : ${author?.dateModified}')
                          ],
                        )
                      ],
                    ),
                  );
                }
                if(state is LoadingAuthorState){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is InitAuthorState){
                  var box = Hive.box('author_box');
                  Author? author = box.get('author');
                  print('Author : ${author?.id}');
                  if(author != null){
                    return Container(
                      padding: EdgeInsets.all(10),
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
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Name : ${author?.name}')
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width:size.width * 0.8,
                                  child: Text('Link : ${author?.link}'))
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  width:size.width * 0.8,
                                  child: Text('Bio : ${author?.bio}'))
                            ],
                          ),
                          Row(
                            children: [
                              Text('Description : ${author?.description}')
                            ],
                          ),
                          Row(
                            children: [
                              Text('quoteCount : ${author?.quoteCount}')
                            ],
                          ),
                          Row(
                            children: [
                              Text('dateAdded : ${author?.dateAdded}')
                            ],
                          ),
                          Row(
                            children: [
                              Text('dateModified : ${author?.dateModified}')
                            ],
                          )
                        ],
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