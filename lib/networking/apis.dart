

import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:quote_app/quote/data/models/quote.dart';

import '../quote/data/models/author.dart';

class Apis {

  // String authorQuoteUrl = '/authors?query=Einstein';



  Future<Author> getAuthorQuote({required String author}) async {
    print('Author Name : ${author}');
    Author authorData = Author();
    String authorQuoteUrl = 'https://api.quotable.io/search/authors?query=${author}';

    (ApiServices.dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    final response = await ApiServices.dio.get(authorQuoteUrl);

    // print('response : ${response}');

    if(response.statusCode == 200){
      authorData = Author().fromMap(response.data);
      // print('author Data : ${authorData.id}');
    }

    return authorData;
  }

  Future<List<Quote>?> searchQuote({required String query,int? limit}) async {
    List<Quote>? quotesList = [];
    var box = Hive.box('quotes_box');
    // String searchQuoteUrl = 'https://api.quotable.io/search/authors?query=${query}&limit=${limit}';
    String searchQuoteUrl = 'https://api.quotable.io/search/quotes?query=love&limit=10';

    (ApiServices.dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient dioClient) {
      dioClient.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      return dioClient;
    };

    final  response = await ApiServices.dio.get(searchQuoteUrl);
    await box.put('quotes', response.data);
    print('response : ${response.data['results']}');
    final Data = response.data['results'] as List<dynamic>?;
    quotesList = Data?.map((e) => Quote().fromMap(e)).toList();
    return quotesList;
  }

  // Future<void>
}

class ApiServices {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.quotable.io/',
      connectTimeout: 2000,
      headers: {'content-type': 'application/json'},
    ),

  );

}