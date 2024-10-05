import 'package:app2/follow_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FollowProvider()),
      ],
      child: const ProfilePageApp(),
    ),
  );
}

class ProfilePageApp extends StatelessWidget {
  const ProfilePageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Profile Page',
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isLiked = false;
  bool showFullBio = false;

  void toggleBio() {
    setState(() {
      showFullBio = !showFullBio;
    });
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final followProvider = Provider.of<FollowProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile Image
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),

            const SizedBox(height: 20),

            // const CircleAvatar(
            //   radius: 50,
            //   backgroundImage: AssetImage('assets/profile_pic2.png'),
            // ),

            // const SizedBox(height: 20),

            // Name
            const Text(
              'Raj A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Bio with toggle button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    showFullBio
                        ? 'Full-stack developer with a passion for creating mobile and web applications. I love working with Flutter, and I have over 5 years of experience in development.'
                        : 'Full-stack developer with a passion for Flutter...',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: toggleBio,
                    child: Text(showFullBio ? 'Show Less' : 'Show More'),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            IconButton(
              onPressed: toggleLike,
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.grey,
              ),
            ),

            const Text('Like Profile'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: followProvider.toggleFollow,
              child: Text(followProvider.isFollowing ? 'Unfollow' : 'Follow'),
            ),

            const SizedBox(height: 20),

            // Contact Icons
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.email, size: 30),
                SizedBox(width: 20),
                Icon(Icons.phone, size: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
