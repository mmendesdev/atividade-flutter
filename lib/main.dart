import 'package:flutter/material.dart';

void main() {
  runApp(const InstagramClone());
}

class InstagramClone extends StatelessWidget {
  const InstagramClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        leading: const Icon(Icons.camera_alt_outlined, color: Colors.black),
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 30,
            color: Colors.black,
          ),
        ),
        actions: [
          const Icon(Icons.favorite_border, color: Colors.black),
          const SizedBox(width: 16),
          const Icon(Icons.send_outlined, color: Colors.black),
          const SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          // Stories
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(6),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/${index + 10}.jpg',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'user$index',
                        style: const TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(height: 1),

          // Feed
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // User info
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/women/${index + 1}.jpg',
                        ),
                      ),
                      title: Text('user$index'),
                      trailing: const Icon(Icons.more_vert),
                    ),

                    // Post image
                    Image.network(
                      'https://picsum.photos/500/300?random=$index',
                      width: double.infinity,
                      height: 300,
                      fit: BoxFit.cover,
                    ),

                    // Action buttons
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      child: Row(
                        children: const [
                          Icon(Icons.favorite_border, size: 28),
                          SizedBox(width: 16),
                          Icon(Icons.comment_outlined, size: 28),
                          SizedBox(width: 16),
                          Icon(Icons.send_outlined, size: 28),
                          Spacer(),
                          Icon(Icons.bookmark_border, size: 28),
                        ],
                      ),
                    ),

                    // Caption
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'user$index ',
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const TextSpan(text: 'Essa é uma legenda de exemplo...'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
