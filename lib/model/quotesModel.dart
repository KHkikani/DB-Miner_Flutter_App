class Quotes {
  int? id;
  String quote;
  String author;
  List tags;
  int length;

  Quotes({
    this.id,
    required this.quote,
    required this.author,
    required this.tags,
    required this.length
  });

  factory Quotes.fromJSON({required Map data}) {
    return Quotes(
      quote: data['content'],
      author: data['author'],
      tags: data['tags'],
      length: data['length'],
    );
  }

  factory Quotes.fromDB({required Map data}) {
    return Quotes(
      id: data['id'],
      quote: data['quote'],
      author: data['author'],
      tags: data['tags'].split(" "),
      length: data['length'],
    );
  }


}
