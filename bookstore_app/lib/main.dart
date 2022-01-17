// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:bookstore_app/data_service/book_service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  BookService bookService = BookService();
  late List<Book> books;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFe6e6e6),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(child: Icon(Icons.menu, color: Colors.black)),
        actions: [
          InkWell(
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(),
              onPressed: () {},
              child: Text("Sign in", style: TextStyle()),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: size.height * 0.1,
                width: double.infinity,
                child: TextField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    suffixIcon: InkWell(
                        onTap: () {},
                        child: Material(
                          color: Colors.blue,
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border.all(
                    color: Colors.black38,
                  ),
                ),
                height: size.height * 0.07,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Productivity"),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        padding: EdgeInsets.all(6.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          borderRadius: BorderRadius.circular(8.00),
                        ),
                        child: Text("Sup motherfuckers"),
                      ),
                    ],
                  ),
                )),
            SizedBox(height: size.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Subjects",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Author",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  onPressed: () {},
                  child: Text(
                    "Publisher",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ],
            ),
            FutureBuilder<ListOfBook>(
                future: bookService.getBook(),
                builder: (context, snapshot) {
                  List<Book> books = snapshot.data!.books;
                  if (snapshot.hasData)
                    return Container(
                      margin: EdgeInsets.all(20),
                      height: size.height,
                      width: double.infinity,
                      color: Colors.white,
                      child: Column(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Recently Sold Products",
                              style: TextStyle(
                                fontSize: 22,
                              ),
                            ),
                          ),
                          Wrap(
                            children: [
                                ... books.map((book){
                                  return Container(
                                    margin: EdgeInsets.all(10.0),
                                    height: size.height * 0.2,
                                    width: size.width * 0.35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.blue,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      // ignore: prefer_const_literals_to_create_immutables
                                      children: [
                                        Text(book.name),
                                        Text("${book.price}"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: OutlinedButton(
                                            style: OutlinedButton.styleFrom(),
                                            onPressed: () {},
                                            child: Text(
                                              "Add to cart",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              
                              Container(
                                margin: EdgeInsets.all(10.0),
                                height: size.height * 0.2,
                                width: size.width * 0.35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Text("Book name"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  return CircularProgressIndicator();
                }),
          ],
        ),
      ),
    );
  }
}
