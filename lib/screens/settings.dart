import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_chat/modules/avatar_row.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  ScrollController _scrollController = ScrollController();
  String _appBarText = "";
  bool _showAppBarText = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 30) {
        if (!_showAppBarText) {
          setState(() {
            _showAppBarText = true;
            _appBarText = "";
          });
        }
      } else {
        if (_showAppBarText) {
          setState(() {
            _showAppBarText = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Center(
          child: Text(
            _showAppBarText ? _appBarText : "Settings",
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              SizedBox(
                //color: Colors.blue,
                height: 50,
                width: 380,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 35,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search",
                            filled: true,
                            fillColor: Colors.grey.shade300,
                            prefixIcon: const Icon(
                              Icons.search_outlined,
                              size: 24,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 1),
                            hintStyle: const TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Container(
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const CircleAvatar(
                              maxRadius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/yoga.png"),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nilam",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Online",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              color: Colors.black12,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.qr_code,
                              color: Colors.blue,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Icon(
                              Icons.av_timer,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            "Avatar",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                          const Spacer(),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            color: Colors.grey,
                            size: 21,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    AvatarRow(
                      icon: const Icon(Icons.star),
                      name: "Starred Messages",
                      color: Colors.orangeAccent,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.computer_outlined),
                      name: "Linked Devices",
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    AvatarRow(
                      icon: const Icon(Icons.key),
                      name: "Account",
                      color: Colors.indigoAccent,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.lock),
                      name: "Privacy",
                      color: Colors.cyan,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(CupertinoIcons.chat_bubble_fill),
                      name: "Chats",
                      color: Colors.green,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.notification_add),
                      name: "Notifications",
                      color: Colors.red,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.currency_rupee),
                      name: "Privacy",
                      color: Colors.teal,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.data_thresholding_outlined),
                      name: "Storage and Data",
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 87,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    AvatarRow(
                      icon: const Icon(Icons.help),
                      name: "Help",
                      color: Colors.indigoAccent,
                    ),
                    const Divider(
                      thickness: 1,
                      indent: 55,
                    ),
                    AvatarRow(
                      icon: const Icon(Icons.favorite),
                      name: "Tell a Friend",
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
