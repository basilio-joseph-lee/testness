import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
        home: MyApp(),
        debugShowCheckedModeBanner: false,
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text("Home" ,style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: Icon(Icons.menu, size: 30,),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [

            Expanded(child:
            DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
                      child: TabBar(
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.blue
                          ),
                          tabAlignment: TabAlignment.start, // Align tabs to the left
                          isScrollable: true, // Enable horizontal scrolling
                          padding: EdgeInsets.zero, // Remove default padding
                          indicatorPadding: EdgeInsets.zero, // Remove default padding
                          labelColor: Colors.white, // Set label color
                          unselectedLabelColor: Colors.black, // Set unselected label color
                          dividerColor: Colors.transparent,// Set divider color
                          indicatorSize: TabBarIndicatorSize.label, // Set indicator size to label width
                          labelPadding: EdgeInsets.only(right: 5),// Set label padding

                          tabs: [
                            Tab(child:
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              child: Text("Events"),
                            ),),
                            Tab(child:
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                              child: Text("News"),
                            ),)
                          ]),
                    ),

                    Expanded(child:
                    TabBarView(children: [

                      // Tab 1 content
                      Center(child: Text("Events"),),

                      // Tab 2 content
                      Center(child: Text("News"),)

                    ]))



                  ],
                )
            )
            ),






          ],

        ),


      ),
    );
  }
}
