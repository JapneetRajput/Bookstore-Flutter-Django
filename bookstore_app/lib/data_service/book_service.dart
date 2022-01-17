import 'dart:convert';

import 'package:http/http.dart' as http;

class BookService {
  Future<ListOfBook> getBook() async {
    var response =
        await http.get(Uri.parse("http://127.0.0.1:8000/book/booklist"));

    return ListOfBook.fromList(jsonDecode(response.body));
  }
}

class ListOfBook {
  List<Book> books;
  ListOfBook({required this.books});
  factory ListOfBook.fromList(List list) {
    List<Book> _books = [];
    for (var element in list) {
      _books.add(Book.fromJson(element));
    }
    return ListOfBook(books: _books);
  }
}

class Book {
  int id;
  String name;
  int price;
  int discount;
  String author;
  String publisher;
  String image;
  String preview;
  String last_sold;
  String subject;
  Book({
    required this.id,
    required this.name,
    required this.price,
    required this.discount,
    required this.author,
    required this.publisher,
    required this.image,
    required this.last_sold,
    required this.preview,
    required this.subject,
  });

  factory Book.fromJson(map) {
    return Book(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      discount: map['discount'],
      author: map['author'],
      publisher: map['publisher'],
      image: map['image'],
      last_sold: map['last_sold'],
      preview: map['preview'],
      subject: map['subject'],
    );
  }
}