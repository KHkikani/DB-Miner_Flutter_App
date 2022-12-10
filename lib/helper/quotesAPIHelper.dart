import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:life_quotes/model/quotesModel.dart';

class QuotesAPIHelper {
  QuotesAPIHelper._();

  static final QuotesAPIHelper quotesAPIHelper = QuotesAPIHelper._();

  Future<List<Quotes>?> getQuotes({required int pageNO}) async {
    Uri uri =
        Uri.parse("https://quotable.io/quotes?page=${pageNO.toString()}}");

    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      Map decodedQuotesData = jsonDecode(res.body);

      List quotesList = decodedQuotesData['results'];

      return quotesList.map((e) => Quotes.fromJSON(data: e)).toList();
    } else {
      return null;
    }
  }
}
