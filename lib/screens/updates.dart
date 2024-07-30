import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_chat/data.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final ScrollController _scrollController = ScrollController();
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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(
              Icons.more_horiz,
              color: Colors.blue,
            ),
          ),
        ],
        title: Center(
          child: Text(
            _showAppBarText ? _appBarText : "Updates",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Updates",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: FloatingActionButton(
                          onPressed: () {},
                          elevation: 0,
                          backgroundColor: Colors.black12,
                          child: const Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 2),
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        maxRadius: 25,
                        backgroundImage:
                            AssetImage("assets/images/yoga.png"),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "My Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "2h ago",
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: 20),
                Text(
                  "RECENT UPDATES",
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const SizedBox(
              height: 10,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              maxRadius: 25,
                              backgroundImage: AssetImage(
                                data[index]["dp"],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]["name"],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              data[index]["time"],
                              style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Divider(
                              height: 1,
                              thickness: 1,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.grey,
                      indent: 80,
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
