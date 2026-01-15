import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

// Model class
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}

// Fetch API
Future<List<User>> fetchUsers() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter API Display Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API Data Display Demo'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'ListView'),
              Tab(text: 'Separated'),
              Tab(text: 'GridView'),
              Tab(text: 'Expansion'),
              Tab(text: 'PageView'),
              Tab(text: 'SliverList'),
              Tab(text: 'DataTable'),
            ],
          ),
        ),
        body: FutureBuilder<List<User>>(
          future: fetchUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final users = snapshot.data!;
              return TabBarView(
                children: [
                  // 1️⃣ ListView.builder
                  ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(u.id.toString())),
                        title: Text(u.name),
                        subtitle: Text(u.email),
                      );
                    },
                  ),

                  // 2️⃣ ListView.separated
                  ListView.separated(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return ListTile(
                        leading: CircleAvatar(child: Text(u.id.toString())),
                        title: Text(u.name),
                        subtitle: Text(u.email),
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(),
                  ),

                  // 3️⃣ GridView.builder
                  GridView.builder(
                    padding: const EdgeInsets.all(8),
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return Card(
                        color: Colors.blue[50],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(u.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(u.email),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // 4️⃣ ExpansionTile
                  ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return ExpansionTile(
                        leading: CircleAvatar(child: Text(u.id.toString())),
                        title: Text(u.name),
                        subtitle: Text(u.email),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Extra details can go here'),
                          ),
                        ],
                      );
                    },
                  ),

                  // 5️⃣ PageView.builder
                  PageView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final u = users[index];
                      return Card(
                        margin: const EdgeInsets.all(20),
                        color: Colors.orange[50],
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(u.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text(u.email),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  // 6️⃣ CustomScrollView + SliverList
                  CustomScrollView(
                    slivers: [
                      const SliverAppBar(
                        pinned: true,
                        expandedHeight: 60,
                        flexibleSpace: FlexibleSpaceBar(title: Text("SliverList")),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (context, index) {
                            final u = users[index];
                            return ListTile(
                              leading: CircleAvatar(child: Text(u.id.toString())),
                              title: Text(u.name),
                              subtitle: Text(u.email),
                            );
                          },
                          childCount: users.length,
                        ),
                      ),
                    ],
                  ),

                  // 7️⃣ DataTable
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columns: const [
                        DataColumn(label: Text('ID')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Email')),
                      ],
                      rows: users
                          .map(
                            (u) => DataRow(
                          cells: [
                            DataCell(Text(u.id.toString())),
                            DataCell(Text(u.name)),
                            DataCell(Text(u.email)),
                          ],
                        ),
                      )
                          .toList(),
                    ),
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
