// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_books_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchBooksModel _$SearchBooksModelFromJson(Map<String, dynamic> json) {
  return SearchBooksModel(
    json['total'] as int,
    json['count'] as int,
    (json['books'] as List)
        ?.map(
            (e) => e == null ? null : _Book.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

_Book _$_BookFromJson(Map<String, dynamic> json) {
  return _Book(
    json['title'] as String,
    (json['author'] as List)?.map((e) => e as String)?.toList(),
  );
}