import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
part 'author.g.dart';

@HiveType(typeId: 1)
class Author {
  Author(
      {
        this.id,
         this.name,
         this.link,
         this.bio,
         this.description,
         this.quoteCount,
         this.slug,
         this.dateAdded,
         this.dateModified,
      });

  @HiveField(0)
  final String? id;
  @HiveField(1)
  final String? name;
  @HiveField(2)
  final String? link;
  @HiveField(3)
  final String? bio;
  @HiveField(4)
  final String? description;
  @HiveField(5)
  final int? quoteCount;
  @HiveField(6)
  final String? slug;
  @HiveField(7)
  final String? dateAdded;
  @HiveField(8)
  final String? dateModified;

  // @override
  // Map<String, dynamic> toMap() {
  //   final Map<String, dynamic> map = <String, dynamic>{};
  //   map['user_phone'] = userPhone;
  //   map['form_name'] = formName;
  //
  //   return map;
  // }

  @override
  Author fromMap(dynamic dynamicData) {
    print('dynamic : ${dynamicData['results']}');
    return Author(
      id: dynamicData['results'][0]['_id'],
      name: dynamicData['results'][0]['name'],
      link: dynamicData['results'][0]['link'],
      bio: dynamicData['results'][0]['bio'],
      description: dynamicData['results'][0]['description'],
      quoteCount: dynamicData['results'][0]['quoteCount'],
      slug: dynamicData['results'][0]['slug'],
      dateAdded: dynamicData['results'][0]['dateAdded'],
      dateModified: dynamicData['results'][0]['dateModified'],

    );
  }
}
