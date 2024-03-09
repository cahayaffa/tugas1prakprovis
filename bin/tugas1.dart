import 'package:tugas1/tugas1.dart' as tugas1;

import 'dart:io';

import 'dart:developer' as developer;

void main(List<String> arguments) async {
  Library library = Library();
  print('Library Management System');

  int choice;

  String title;

  print('=========================Menu=========================');
  print('1. Add Book');
  print('2. Display Books');
  print('3. Borrow Book');
  print('4. Return Book');
  print('-1. Exit');
  print('======================================================');

  do {
    print('Enter your choice: ');
    choice = int.parse(stdin.readLineSync() ?? '0');

    switch (choice) {
      case 1:
        await library.addBook();
        break;

      case 2:
        library.displayBooks();
        break;

      case 3:
        await library.borrowBook();
        break;

      case 4:
        library.returnBook();
        break;

      case 5:
    }
  } while (choice != -1);
}

class Library {
  List<Book> books = [];

  Future<void> addBook() async {
    String? id;
    String? title;
    String? author;
    String? genre;
    int? quantity;

    print('Enter id: ');
    id = stdin.readLineSync();

    await checkIfIdExist(id).then((value) {
      if (value) {
        print('Book with id $id already exist');
        return;
      }

      print('Enter title: ');
      title = stdin.readLineSync();

      print('Enter author: ');
      author = stdin.readLineSync();

      print('Enter genre: ');
      genre = stdin.readLineSync();

      print('Enter quantity: ');
      quantity = int.parse(stdin.readLineSync() ?? '0');

      print('Value: $value');

      Book book = Book(id, title, author, genre, quantity ?? 0);
      books.add(book);

      print('Book added successfully\n');
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void displayBooks() {
    developer.inspect(books);

    for (var book in books) {
      book.display();
    }
  }

  Future<void> borrowBook() async {
    String? id;
    print ("enter id");
    id = stdin.readLineSync();
    var book = books.firstWhere((element) => element.id == id);
    await book.borrow();
  }

  void returnBook() {
    String? id;
    print ("enter id");
    id = stdin.readLineSync();
    var book = books.firstWhere((element) => element.id == id);
    book.returnBook();
  }

  Future<bool> checkIfIdExist(String? id) {
    return Future.value(books.any((element) => element.id == id));
  }
}

class Book {
  String? id;
  String? title;
  String? author;
  String? genre;
  int quantity;

  Book(this.id, this.title, this.author, this.genre, this.quantity);

  void display() {
    print('Title: $title \n');
    print('Author: $author \n');
    print('Genre: $genre \n');
    print('Quantity: $quantity \n');
  }

  Future<void> borrow() async {
    await checkAvailability().then((value) {
      if (value) {
        quantity--;
        print('Book borrowed successfully');
      } else {
        print('Book not available');
      }
    }).catchError((error) {
      print('Error: $error');
    });
  }

  void returnBook() {
    quantity++;
    print('Book returned successfully');
  }

  Future<bool> checkAvailability() {
    return Future.value(quantity > 0);
  }
}