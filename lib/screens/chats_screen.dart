import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBarrText = true;
  String _appBarText = "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset < 30) {
        if (!_showAppBarrText) {
          setState(() {
            _showAppBarrText = true;
            _appBarText = "";
          });
        }
      } else {
        if (_showAppBarrText) {
          setState(() {
            _showAppBarrText = false;
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
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        title: Center(
          child: Text(
            _showAppBarrText ? _appBarText : "Chats",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        leading: TextButton(
          onPressed: () {},
          child: const Text(
            "Edit",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt_outlined,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Chats",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        //color: Colors.blue,
                        height: 50,
                        width: 360,
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
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.line_horizontal_3_decrease,
                                color: Colors.blue,
                                size: 21,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 380,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Broadcast Lists",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "New Group",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 1,
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            maxRadius: 25,
                            backgroundImage: AssetImage(
                              data[index]["dp"],
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data[index]["name"]}",
                                style: const TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            "${data[index]["subTitle"]}",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "${data[index]["time"]}",
                                style: data[index]["unReadMsg"] == 0
                                    ? const TextStyle(color: Colors.grey)
                                    : const TextStyle(color: Colors.blue),
                              ),
                              const SizedBox(height: 5),
                              data[index]["unReadMsg"] == 0
                                  ? Container(
                                      width: 0,
                                    )
                                  : Container(
                                      width: 25,
                                      height: 25,
                                      decoration: const BoxDecoration(
                                        color: Colors.blue,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Center(
                                        child: Text(
                                          "${data[index]["unReadMsg"]}",
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 2,
                          thickness: 1,
                          indent: 75,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
