
import 'http_manager.dart';
import '../search_books_model.dart';

class Http {
  static Future<SearchBooksModel> searchBooks(Map<String, dynamic> params) {
    return HttpManager.get('/v2/book/search',
        params: params,
        dataParsing: ((data) => SearchBooksModel.fromJson(data)),
    );
  }
}