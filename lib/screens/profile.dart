import 'package:flutter/material.dart';
import 'package:netflix_clone/themes/themes.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Netflix',
          style: heading1,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cast,
            ),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/profile.jpeg',
            width: 50,
          ),
          const Text(
            'Vishnu',
            style: heading1,
          ),
          const SizedBox(
            height: 50,
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/notification-bell.png',
              width: 40,
            ),
            title: const Text('Notifications'),
            titleTextStyle: heading1,
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: Image.asset(
              'assets/images/download.png',
              width: 40,
            ),
            title: const Text('Downloads'),
            titleTextStyle: heading1,
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
