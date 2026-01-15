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

  void _showDataBottom (BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.white,
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 500,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      width: 40,
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text("What is Kids Cancervive Inc. ?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800
                    ),
                  ),
                  SizedBox(height: 16),

                  Text(
                    'Kids Cancervive Inc. is a non-profit organization dedicated to providing support, financial aid, and advocacy for children battling cancer and their families.',
                    style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                  ),
                  SizedBox(height: 16),

                  Text(
                    'The foundation plays a crucial role in helping young cancer patients access lifesaving treatments, receive emotional and psychological support, and find financial assistance to ease the burden of medical expenses. Recognizing the challenges families face when dealing with childhood cancer, KidsCanCervive Inc. works tirelessly to raise awareness, build community support, and collaborate with healthcare institutions to ensure no child fights cancer alone.',
                    style: TextStyle(fontSize: 12, color: Colors.black87, height: 1.4),
                  ),
                  SizedBox(
                    height: 25,
                  ),

                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.blue,
                          child: Icon(Icons.favorite_border, color: Colors.white, size: 35,),
                        ),
                        SizedBox(height: 10,),
                        Text("Donate Now", style: TextStyle(fontWeight: FontWeight.w800),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Text("Home" ,style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),),
        ),

        leading:
        Builder(builder: (context)
        => IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: Icon(Icons.menu)))
        ,


        backgroundColor: Colors.white,
        elevation: 0,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                    color: Colors.blue
                ),
                child: Text("Header")
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(Icons.home),
            )
          ],
        ),
      ),


      body: Container(
        child: Column(
          children: [






          ],

        ),


      ),
    );
  }
}
