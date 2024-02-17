import 'package:fast_app/views/message/maessage_screen.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Map> items = [
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "verified": true,
      "last_seen": "11:11",
      "is_online": true,
      "last_msg": [
        "i hop to see you and i am happy to see you",
        "hello",
        "i am fine",
        "i am happy to see you"
      ],
      "msg": ["hello", "i am fine", "i am happy to see you"]
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "verified": true,
      "last_seen": "11:11",
      "is_online": true,
      "last_msg": ["i hop to see you and i am happy to see you"],
      "msg": ["hello", "i am fine", "i am happy to see you"]
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "verified": true,
      "last_seen": "11:11",
      "is_online": true,
      "last_msg": ["i hop to see you and i am happy to see you"],
      "msg": ["hello", "i am fine", "i am happy to see you"]
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "verified": true,
      "last_seen": "11:11",
      "is_online": true,
      // "last_msg": [],
      "msg": ["hello", "i am fine", "i am happy to see you"]
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "verified": true,
      "last_seen": "11:11",
      // "last_msg": [],
      "is_online": true,
      "msg": ["hello", "i am fine", "i am happy to see you"]
    }
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF075E55),
          title: const Text(
            'Statash',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.search_outlined),
              color: Colors.white.withOpacity(0.7),
            ),
            IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.more_vert),
              color: Colors.white.withOpacity(0.7),
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.white.withOpacity(0.5),
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'CHATS',
              ),
              Tab(
                text: 'STATUS',
              ),
              Tab(
                text: 'MANAGE',
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFF075E55),
          onPressed: () => {},
          child: Icon(
            Icons.message,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.zero,
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        data: items[index],
                      ),
                    ),
                  ),
                },
                title: Text(
                  items[index]['name'],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      items[index]['image'],
                    ),
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(items[index]['last_seen']),
                        items[index]['last_msg'] is List
                            ? Container(
                                height: 20,
                                width: 20,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    items[index]['last_msg'].length.toString(),
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                              )
                            : const Icon(Icons.check),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),
                subtitle: Text(
                  items[index]['last_msg'] is List
                      ? items[index]['last_msg']
                          [items[index]['last_msg'].length - 1]
                      : items[index]['msg'][items[index]['msg'].length - 1],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const Center(
              child: Text('Home'),
            ),
            const Center(
              child: Text('Home'),
            ),
            const Center(
              child: Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
