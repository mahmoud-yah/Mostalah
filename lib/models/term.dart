import 'dart:convert';

import 'package:mostalah/data/constants.dart';

Term clientFromJson(String str) {
  final jsonData = json.decode(str);
  return Term.fromMap(jsonData);
}

String clientToJson(Term data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Term {
  int? id;
  String egyptianTerm;
  String syrianTerm;
  bool isFavorite;

  Term({
    this.id,
    required this.egyptianTerm,
    required this.syrianTerm,
    required this.isFavorite,
  });

  // toJson(){
  //   return{
  //     syrianTermColumn: syrianTerm,
  //     egyptianTermColumn: egyptianTerm,
  //     favoriteColumn: isFavorite,
  //   };
  // }
  //
  //  Term.fromJson(Map<String , dynamic> map){
  //   id=map[idColumn];
  //   syrianTerm=map[syrianTermColumn];
  //   egyptianTerm=map[egyptianTermColumn];
  //   isFavorite=map[favoriteColumn];
  // }

  factory Term.fromMap(Map<String, dynamic> json) => Term(
        id: json[idColumn],
        egyptianTerm: json[egyptianTermColumn],
        syrianTerm: json[syrianTermColumn],
        isFavorite: json[favoriteColumn] == 1,
      );

  Map<String, dynamic> toMap() => {
        // idColumn: id,
        egyptianTermColumn: egyptianTerm,
        syrianTermColumn: syrianTerm,
        favoriteColumn: isFavorite ? 1 : 0,
      };
}
