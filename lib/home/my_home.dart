import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  List<Map> items = [
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/200/300",
      "verified": true
    },
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/300/300",
      "verified": true
    },
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/200/300",
      "verified": false
    },
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/200/300",
      "verified": true
    },
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/300/300",
      "verified": true
    },
    {
      "profile": "ss",
      "name": "shiam",
      "eamil": "shiam@gmail.com",
      "phone": "1234567890",
      "image": "https://picsum.photos/200/300",
      "verified": false
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            debugPrint('Menu button pressed');
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu_book),
        ),
        title: const Text('Home'),
        backgroundColor: Colors.blue,
        elevation: 50,
        shadowColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Search button pressed');
            },
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              debugPrint('Search button pressed');
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
        bottom: AppBar(
          automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          // leading: IconButton(
          //   onPressed: () {
          //     debugPrint('Menu button pressed');
          //     scaffoldKey.currentState?.openEndDrawer();
          //   },
          //   icon: const Icon(Icons.menu_book),
          // ),
          // title: const Text('Bottom',
          //     style: TextStyle(
          //         color: Colors.blue,
          //         fontSize: 20,
          //         fontWeight: FontWeight.bold)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add, color: Colors.blue),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
      ),
      drawer: const Drawer(
        backgroundColor: Colors.blue,
        elevation: 100,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DrawerHeader(child: Text('Header')),
              Text('Drawer'),
              Text('Drawer'),
              Text('Drawer')
            ],
          ),
        ),
      ),
      // endDrawer: const Drawer(),
      // body: const Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text('Home'),
      //       Text('Home 1'),
      //       Text('Home 2'),
      //       Row(children: [
      //         Text('Home'),
      //         Text('Home 1'),
      //         Text('Home 2'),
      //       ])
      //     ],
      //   ),
      // ),
      body: Column(
        children: [
          // Expanded(
          //     flex: 6,
          //     child: Container(
          //       color: Colors.green,
          //       height: 100,
          //       width: double.infinity,
          //       child: const Text('Home'),
          //     )),
          // Expanded(
          //     flex: 2,
          //     child: Container(
          //         color: Colors.red,
          //         height: 100,
          //         width: 100,
          //         child: const Text('Home')))
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 300,
                  color: Colors.blue,
                  margin: const EdgeInsets.all(10),
                  child: Card(
                    child: ListTile(
                      title: Text(items[index]['name']),
                      subtitle: Text(items[index]['eamil']),
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage(items[index]['image'])),
                      trailing: items[index]['verified']
                          ? const Icon(Icons.verified)
                          : IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.more_vert),
                            ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
