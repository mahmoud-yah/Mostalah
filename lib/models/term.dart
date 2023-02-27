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
  String? id;
  String egyptianTerm;
  String syrianTerm;
  String termDescription;
  bool isFavorite;

  Term({
    this.id,
    required this.egyptianTerm,
    required this.syrianTerm,
    required this.termDescription,
    required this.isFavorite,
  });

  bool compareTerms(Term termToCompare) {
    if (id == termToCompare.id) {
      return true;
    }
    return false;
  }

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
        termDescription: json[termDescriptionColumn],
        isFavorite: json[favoriteColumn] == 1,
      );

  factory Term.fromMapWithID(Map<String, dynamic> json, String id) => Term(
        id: id,
        egyptianTerm: json[egyptianTermColumn],
        syrianTerm: json[syrianTermColumn],
        termDescription: json[termDescriptionColumn],
        isFavorite: json[favoriteColumn] == 1,
      );

  Map<String, dynamic> toMap() => {
        idColumn: id,
        egyptianTermColumn: egyptianTerm,
        syrianTermColumn: syrianTerm,
        termDescriptionColumn: termDescription,
        favoriteColumn: isFavorite ? 1 : 0,
      };
}
