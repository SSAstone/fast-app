import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  final Map data;
  const MessageScreen({super.key, required this.data});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  List<Map> chatItems = [
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "last_seen": "11:11",
      "message": "i am happy to see you",
      "status": "left"
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "last_seen": "11:11",
      "message": "i am happy to see you",
      "status": "right"
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "last_seen": "11:11",
      "message": "i am happy to see you",
      "status": "left"
    },
    {
      "name": "shiam",
      "image": "https://picsum.photos/200/300",
      "last_seen": "11:11",
      "message": "i am happy to see you",
      "status": "right"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF075E55),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white.withOpacity(0.7)),
          ),
          title: Expanded(
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.data['name'],
                style: TextStyle(
                  color: Colors.white.withOpacity(0.7),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'last seen ${widget.data['last_seen']} messages',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.data['image'],
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: Colors.white70),
            )
          ]),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: chatItems.length,
              itemBuilder: (context, index) {
                final data = chatItems[index];
                return Column(
                  crossAxisAlignment: data['status'] == 'left'
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      padding: const EdgeInsets.all(10),
                      constraints: const BoxConstraints(
                        minWidth: 260,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF075E55),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        chatItems[index]['message'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    Text(
                      data['last_seen'],
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),  
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.emoji_emotions_outlined),
                        suffixIcon: Icon(Icons.camera_alt),
                        hintText: 'Type a message',
                        border: InputBorder.none,
                      )
                    )
                  ),
                ),

                const SizedBox(width: 10),
                CircleAvatar(
                  backgroundColor: const Color(0xFF075E55),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
