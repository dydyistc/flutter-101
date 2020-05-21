
import 'package:json_annotation/json_annotation.dart';

part 'search_books_model.g.dart';

@JsonSerializable(createToJson: false)
class SearchBooksModel {
  int total;
  int count;
  List<_Book> books;

  SearchBooksModel(this.total, this.count, this.books);
  factory SearchBooksModel.fromJson(Map<String, dynamic> json) => _$SearchBooksModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class _Book {
  String title;
  List<String> author;

  _Book(this.title, this.author);
  factory _Book.fromJson(Map<String, dynamic> json) => _$_BookFromJson(json);
}