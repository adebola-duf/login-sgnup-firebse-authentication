import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
    required this.user,
  });
  final User user;
  @override
  Widget build(BuildContext context) {
    final String? userDisplayName = user.displayName;
    final String? userProfileImageUrl = user.photoURL;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/background.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: double.infinity,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const Gap(10),
                Row(
                  children: [
                    const Spacer(),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: userProfileImageUrl == null
                          ? null
                          : NetworkImage(userProfileImageUrl),
                      backgroundColor: userProfileImageUrl == null
                          ? const Color.fromARGB(255, 199, 84, 7)
                          : null,
                      child: userProfileImageUrl == null
                          ? Text(userDisplayName == null
                              ? 'A'
                              : userDisplayName[0])
                          : null,
                    ),
                    const Gap(10),
                    IconButton(
                      onPressed: () async =>
                          await FirebaseAuth.instance.signOut(),
                      icon: SvgPicture.asset(
                        'assets/icons/logout-icon.svg',
                        height: 30,
                      ),
                    ),
                    const Gap(10),
                  ],
                ),
                const Divider(),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/github-logo.svg',
                              height: 30,
                            ),
                            SvgPicture.asset(
                              'assets/icons/gmail-logo.svg',
                              height: 30,
                            ),
                            SvgPicture.asset(
                              'assets/icons/linkedin-logo.svg',
                              height: 30,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
