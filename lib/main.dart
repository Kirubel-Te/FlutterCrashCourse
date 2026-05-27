import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widget Demo",
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  String selectedCourse = "Flutter";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text("Common Widgets"),

        leading: const BackButton(),

        actions: [

          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),

          PopupMenuButton(
            itemBuilder: (context) => [

              const PopupMenuItem(
                value: 1,
                child: Text("Settings"),
              ),

              const PopupMenuItem(
                value: 2,
                child: Text("Logout"),
              ),

            ],
          ),

        ],

        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),

        bottom: TabBar(
          controller: _tabController,
          tabs: const [

            Tab(
              icon: Icon(Icons.home),
              text: "Home",
            ),

            Tab(
              icon: Icon(Icons.person),
              text: "Profile",
            ),

          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,

        children: [

          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  const Text(
                    "Dropdown Button",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  DropdownButton<String>(

                    value: selectedCourse,

                    items: const [

                      DropdownMenuItem(
                        value: "Flutter",
                        child: Text("Flutter"),
                      ),

                      DropdownMenuItem(
                        value: "React",
                        child: Text("React"),
                      ),

                      DropdownMenuItem(
                        value: "Vue",
                        child: Text("Vue"),
                      ),

                    ],

                    onChanged: (value) {

                      setState(() {
                        selectedCourse = value!;
                      });

                    },
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "RichText Example",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  RichText(

                    text: const TextSpan(

                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),

                      children: [

                        TextSpan(
                          text: "Learn ",
                        ),

                        TextSpan(
                          text: "Flutter ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),

                        TextSpan(
                          text: "Easily!",
                        ),

                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Buttons",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(

                    children: [

                      ElevatedButton(
                        onPressed: () {},
                        child: const Text("Elevated"),
                      ),

                      const SizedBox(width: 10),

                      TextButton(
                        onPressed: () {},
                        child: const Text("Flat"),
                      ),

                    ],
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Row(

                    children: [

                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.orange,
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 20),

                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.amber.shade100,

                          child: const Text(
                            "This is a simple Flutter demo app using common widgets.",
                          ),
                        ),
                      ),

                    ],
                  ),

                  const SizedBox(height: 20),

                  const Divider(),

                  const SizedBox(height: 20),

                  Stack(

                    children: [

                      Container(
                        height: 120,
                        width: double.infinity,
                        color: Colors.blue.shade100,
                      ),

                      Positioned(
                        top: 30,
                        left: 30,

                        child: Container(
                          height: 60,
                          width: 60,
                          color: Colors.red,
                        ),
                      ),

                    ],
                  ),

                ],
              ),
            ),
          ),

          const Center(
            child: Text(
              "Profile Tab",
              style: TextStyle(fontSize: 24),
            ),
          ),

        ],
      ),

      floatingActionButton:
          FloatingActionButton(

        onPressed: () {},

        child: const Icon(Icons.add),

      ),
    );
  }
}