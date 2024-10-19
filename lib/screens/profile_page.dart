import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../follow_provider.dart';

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
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_pic.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Raj A',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    showFullBio
                        ? 'Full-stack developer with a passion for creating mobile and web applications...'
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
            // Navigation Button to Edit Profile Page
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/editProfile');
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
