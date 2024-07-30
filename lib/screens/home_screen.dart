import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_chat/screens/updates.dart';
import 'package:ui_chat/screens/calls.dart';
import 'package:ui_chat/screens/chats_screen.dart';
import 'package:ui_chat/screens/communities.dart';
import 'package:ui_chat/screens/settings.dart';
import 'package:ui_chat/screens/updates.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageData = [
    const UpdateScreen(),
    CallsScreen(),
    const Community(),
    const ChatScreen(),
    const Settings()
  ];

  int currentPage = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageData[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white70,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.maps_ugc_outlined,
            ),
            label: "Updates",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.phone,
            ),
            label: "Calls",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person_3,
            ),
            label: "Communities",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.chat_bubble_2_fill,
            ),
            label: "Chats",
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.settings,
            ),
            label: "Updates",
            backgroundColor: Colors.grey,
          ),
        ],
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}
