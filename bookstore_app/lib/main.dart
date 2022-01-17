// ignore_for_file: prefer_const_constructors

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
      body: Column(
        children: [
          SizedBox(
            height: size.height*0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              height: size.height*0.1,
              width: double.infinity,
              child: TextField(
                onChanged: (value){

                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  contentPadding: 
                    EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: 
                      BorderSide(color: Colors.lightBlueAccent,width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: 
                      BorderSide(color: Colors.lightBlueAccent,width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                  ),
                  suffixIcon: InkWell(
                    onTap:(){}, 
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
            
            height: size.height*0.07,
            child:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.all(6.0),
                    decoration:BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                    child:Text("Productivity"),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    padding: EdgeInsets.all(6.0),
                    decoration:BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      borderRadius: BorderRadius.circular(8.00),
                    ),
                    child:Text("Sup motherfuckers"),
                  ),
                ],
              ),
            )
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.white
            ),
            onPressed: (){},
            child: Text(
              "Subjects", 
              style: TextStyle(color: Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
