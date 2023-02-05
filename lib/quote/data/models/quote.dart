import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'quote.g.dart';

@HiveType(typeId: 2)
class Quote {
  Quote(
      {
         this.id,
         this.content,
         this.author,
         this.authorId,
         this.authorSlug,
         this.length,
         this.dateAdded,
         this.dateModified,
      });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? content;
  @HiveField(2)
  final String? author;
  @HiveField(3)
  final String? authorId;
  @HiveField(4)
  final String? authorSlug;
  @HiveField(5)
  final int? length;
  @HiveField(6)
  final String? dateAdded;
  @HiveField(7)
  final String? dateModified;

  // @override
  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> map = <String, dynamic>{};
  //   map['user_phone'] = userPhone;
  //   map['form_name'] = formName;
  //   return map;
  // }

  @override
  Quote fromMap(dynamic dynamicData) {
    return Quote(
      id: dynamicData['_id'],
      content: dynamicData['content'],
      author: dynamicData['author'],
      authorId: dynamicData['authorId'],
      authorSlug: dynamicData['authorSlug'],
      length: dynamicData['length'],
      dateAdded: dynamicData['dateAdded'],
      dateModified: dynamicData['dateModified'],
    );
  }
}
